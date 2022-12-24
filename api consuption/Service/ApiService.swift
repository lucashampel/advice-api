//
//  ApiService.swift
//  api consuption
//
//  Created by lucas meireles on 16/12/22.
//

import UIKit
import Foundation


class ApiService {
    var urlAdvise = URL(string: "https://api.adviceslip.com/advice")!
    
    func getUserData(completion: @escaping (AdviceModel) -> ()){
        let task = URLSession.shared.dataTask(with: urlAdvise) { data, response, error in
            if let data = data {
                if let advice = try? JSONDecoder().decode(AdviceModel.self, from: data){
                    completion(advice)
                }else{
                    print("Error", data)
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        task.resume()
    }
    
}
