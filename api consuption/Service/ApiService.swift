//
//  ApiService.swift
//  api consuption
//
//  Created by lucas meireles on 16/12/22.
//

import UIKit
import Foundation


class ApiService {
    var url = URL(string: "https://639bf96842e3ad69272394f2.mockapi.io/user")!
    var urlAdvise = URL(string: "https://api.adviceslip.com/advice")!
    
//    typealias CompletionHandler = (success:Bool) -> Void
    func getUserDataFinal(completion: @escaping (AdviceModel) -> ()){
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
    
    //get user data an pass it to UserModel
    func getUserData3(){
        var request = URLRequest(url: urlAdvise)
        
//         if auth needed
//        request.allHTTPHeaderFields = [
//            "X-API-Key": "123456789"
//        ]
        
//        HTTP headers
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: urlAdvise) { data, response, error in
            if let data = data {
                if let advice = try? JSONDecoder().decode(AdviceModel.self, from: data){
                    print(advice.obj)
                }else{
                    print("Error", data)
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }

        task.resume()
    }
    
    func getUserData2(){
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard
                    error == nil,
                    let data = data,
                    let string = String(data: data, encoding: .utf8)
                else {
                    print(error ?? "Unknown error")
                    return
                }

                print(string)
            }
            task.resume()
    }
    
    func getUserData(){
        let task = URLSession.shared.dataTask(with: urlAdvise) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
    
    
}
