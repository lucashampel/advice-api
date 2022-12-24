//
//  UserModel.swift
//  api consuption
//
//  Created by lucas meireles on 16/12/22.
//

import Foundation

struct UserModelList : Codable{
    let users:[UserModel]
}

extension UserModelList{
    enum CodingKeys: String, CodingKey{
        case users = "result"
    }
}

struct UserModel: Codable {
    let name: String?
    let age: Double?
    let car: String?
}
