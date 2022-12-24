//
//  ViewController.swift
//  api consuption
//
//  Created by lucas meireles on 16/12/22.
//

import UIKit

class ViewController: UIViewController {
    var api:ApiService = ApiService()
    var screen:MainView?
    
    override func loadView() {
        self.screen = MainView()
        self.view = self.screen
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        screen?.delegate(delegate: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        genereteAdvice()
    }
    
    func genereteAdvice(){
        self.screen?.loadingComponent.startAnimating()
        self.screen?.labelTextView.text = ""
        api.getUserData(completion: { (data) -> Void in
            DispatchQueue.main.async {
                self.screen?.loadingComponent.stopAnimating()
                self.screen?.labelTextView.text = data.obj.advice
            }
        })
    }
}

extension ViewController:ViewControllerDelegate{
    func tappedAdviceButton() {
        genereteAdvice()
    }
}



