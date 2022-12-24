//
//  AdviceModel.swift
//  api consuption
//
//  Created by lucas meireles on 22/12/22.
//

import UIKit

class AdviceModel: Decodable {
    let obj:Advice
}

struct Advice:Decodable{
    let id: Int?
    let advice:String?
}


extension AdviceModel{
    enum CodingKeys: String, CodingKey{
        case obj = "slip"
    }
}
