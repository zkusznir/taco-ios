//
//  FamilyModel.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 24/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import Foundation

typealias Groups = [Group]

struct Group {
    let id: Int
    let name: String
    let usersCount: Int
}
