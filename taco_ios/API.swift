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
    }
    
    enum Result {
        case succes(Any)
        case failure(String)
    }
    
    func request(method: Method, endpoint: Endpoint, id: Int? = nil, completionHandler: @escaping (Result) -> Void) {
        var urlString = baseURL + endpoint.rawValue
        if let id = id { urlString = urlString + "/" + String(id) }
//        if method == .GET { urlString = urlString + ".json"}
        
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
    
    func fetchUser(id: Int, completionHandler: @escaping (User?) -> Void) {
        request(method: .GET, endpoint: .users, id: id) { result in
            switch result {
            case .succes(let jsonData):
                
                guard let json = jsonData as? [[String: Any]] else {
//                    BasicAlert.showInfoAlert(title: "Error", message: "There is no json data as [[String: Any]]")
                    return
                }
                
//                let array = json.compactMap { dict -> Employ? in
//                    guard let id = dict["id"] as? Int,
//                        let name = dict["name"] as? String,
//                        let surName = dict["surname"] as? String else {
//                            return nil
//                    }
//                    return Employ(id: String(id), name: name, surName: surName)
//                }
//                completionHandler(array)
//
            case .failure(let error):
                print("error")
            }
        }
    }
}
