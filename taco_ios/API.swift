//
//  API.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 24/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import Foundation

class RestAPI {
    
    private let baseURL = "https://taco-backend.herokuapp.com/api/v1/"
    
    private var headers: [String: String] {
        return ["Accept": "application/json"]
    }
    
    enum Method: String {
        case GET
        case DELETE
    }
    
    enum Endpoint: String {
        case users
        case groups
        case accounts
    }
    
    enum Result {
        case succes(Any)
        case failure(String)
    }
    
    func request(method: Method, endpoint: Endpoint, id: Int? = nil, additional: Endpoint? = nil, completionHandler: @escaping (Result) -> Void) {
        var urlString = baseURL + endpoint.rawValue
        if let id = id { urlString = urlString + "/" + String(id) }
        if let add = additional { urlString = urlString + "/" + add.rawValue }
        
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        headers.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                print("[REQUEST] ", request.httpMethod ?? "-", " ", request.url ?? "-")
                print("[HEADERS] ", request.allHTTPHeaderFields ?? [:])
                print("[BODY] ", request.httpBody, "\n")

                guard error == nil else {
                    print("[ERROR] ", error!.localizedDescription)
                    completionHandler(.failure(error!.localizedDescription))
                    return
                }
                guard let response = response as? HTTPURLResponse else {
                    completionHandler(.failure("There is no respons as HTTPURLResponse"))
                    return
                }
                print("[CODE] ", response.statusCode)
                print("[HEADERS] ", response.allHeaderFields as! [String: Any])
                guard response.statusCode >= 200, response.statusCode < 300 else {
                    completionHandler(.failure("Status code: \(response.statusCode)"))
                    return
                }
                guard let data = data else {
                    completionHandler(.failure("There is no data"))
                    return
                }
                guard let jsonData = try? JSONSerialization
                    .jsonObject(with: data,
                options: JSONSerialization.ReadingOptions.allowFragments) else {
                                    completionHandler(.failure("There is no json data"))
                                    return
                }
                print("[JSON]", jsonData)
                completionHandler(.succes(jsonData))
            }
        }
        dataTask.resume()
    }
    
    func fetchGroups(id: Int, completionHandler: @escaping (Groups) -> Void) {
        request(method: .GET, endpoint: .users, id: id, additional: .groups) { result in
            switch result {
            case .succes(let jsonData):
                
                guard let array = jsonData as? [Any] else {
                    return
                }
                var groups: [Group] = []
                array.forEach({ obj in
                    guard let dict = obj as? [String: Any] else { return }
                    groups.append(Group(id: dict["id"] as! Int,
                                        name: dict["name"] as! String,
                                        usersCount: dict["users_count"] as! Int))
                })
                
                completionHandler(groups)
                
            case .failure(let error):
                print("error")
            }
        }
    }
    
    func fetchAccounts(id: Int, completionHandler: @escaping (Accounts) -> Void) {
        request(method: .GET, endpoint: .users, id: id, additional: .accounts) { result in
            switch result {
            case .succes(let jsonData):
                
                guard let array = jsonData as? [Any] else {
                    return
                }
                var accounts: [Account] = []
                array.forEach({ obj in
                    guard let dict = obj as? [String: Any] else { return }
                    accounts.append(Account(number: dict["number"] as! String,
                                        type: dict["type"] as! String,
                                        description: dict["description"] as! String))
                })
                
                completionHandler(accounts)
                
            case .failure(let error):
                print("error")
            }
        }
    }
    func fetchMembers(id: Int, completionHandler: @escaping (Members) -> Void) {
        request(method: .GET, endpoint: .groups, id: id, additional: .users) { result in
            switch result {
            case .succes(let jsonData):
                
                guard let array = jsonData as? [Any] else {
                    return
                }
                var members: Members = []
                array.forEach({ obj in
                    guard let dict = obj as? [String: Any] else { return }
                    members.append(Member(id: dict["id"] as! Int,
                                            name: dict["name"] as! String))
                })
                
                completionHandler(members)
                
            case .failure(let error):
                print("error")
            }
        }
    }
}
