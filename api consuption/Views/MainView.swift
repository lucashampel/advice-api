//
//  MainView.swift
//  api consuption
//
//  Created by lucas meireles on 22/12/22.
//

import UIKit

protocol ViewControllerDelegate:AnyObject{
    func tappedAdviceButton()
}

class MainView: UIView {
    
    private weak var delegate:ViewControllerDelegate?
    public func delegate(delegate:ViewControllerDelegate?){
        self.delegate = delegate
    }
    
    lazy var loadingComponent:UIActivityIndicatorView = {
        let act = UIActivityIndicatorView()
        act.translatesAutoresizingMaskIntoConstraints = false
        act.color = .black
        act.isHidden = false
        return act
    }()
    
    
    lazy var labelTextView: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .black
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.sizeToFit()
        text.text = ""
        text.numberOfLines = 3
        return text
    }()
    
    lazy var buttonView: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("New advice", for: .normal)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        bt.setTitleColor(.white, for: .normal)
        bt.clipsToBounds = true
        bt.layer.cornerRadius = 8
        bt.titleLabel?.textAlignment = .center
        bt.backgroundColor = UIColor.purple
        bt.addTarget(self, action: #selector(tappedAdviceButton), for: .touchUpInside)
        return bt
    }()
    
    @objc func tappedAdviceButton(){
        delegate?.tappedAdviceButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.labelTextView)
        self.addSubview(self.buttonView)
        self.addSubview(self.loadingComponent)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            //text advice
            self.labelTextView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            self.labelTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.labelTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            //loading component
            self.loadingComponent.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            self.loadingComponent.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
            self.loadingComponent.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            //button to get advice
            self.buttonView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            self.buttonView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100),
            self.buttonView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        ])
    }
}
