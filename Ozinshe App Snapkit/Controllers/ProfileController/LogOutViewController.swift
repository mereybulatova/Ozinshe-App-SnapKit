//
//  LogOutViewController.swift
//  Ozinshe App Snapkit
//
//  Created by Мерей Булатова on 07.11.2023.
//

import UIKit
import SnapKit

class LogOutViewController: UIViewController {
    
    let backView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 32
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.opacity = 1
        
        let homeView = UIView()
        homeView.backgroundColor = UIColor(red: 0.82, green: 0.835, blue: 0.859, alpha: 1)
        homeView.layer.cornerRadius = 3
        
        let logOutLabel = UILabel()
        logOutLabel.text = "Шығу"
        logOutLabel.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        logOutLabel.textColor = UIColor(red: 0.067, green: 0.094, blue: 0.153, alpha: 1)
        
        let questionLabel = UILabel()
        questionLabel.text = "Сіз шынымен аккаунтыңыздан шығасыз ба?"
        questionLabel.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        questionLabel.textColor = UIColor(red: 0.612, green: 0.639, blue: 0.686, alpha: 1)
        
        let agreeButton = UIButton()
        agreeButton.setTitle("Иә, шығу", for: .normal)
        agreeButton.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        agreeButton.backgroundColor = UIColor(red: 0.5, green: 0.18, blue: 0.99, alpha: 1)
        agreeButton.layer.cornerRadius = 12
        
        let disagreeButton = UIButton()
        disagreeButton.setTitle("Жоқ", for: .normal)
        disagreeButton.setTitleColor(UIColor(red: 0.329, green: 0.082, blue: 0.776, alpha: 1), for: .normal)
        disagreeButton.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        disagreeButton.layer.cornerRadius = 12
        
        view.addSubview(homeView)
        view.addSubview(logOutLabel)
        view.addSubview(questionLabel)
        view.addSubview(agreeButton)
        view.addSubview(disagreeButton)
        
        homeView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(21)
            make.size.equalTo(CGSize(width: 64, height: 5))
            make.centerX.equalToSuperview()
        }
        
        logOutLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(58)
            make.left.equalToSuperview().inset(24)
        }
        
        questionLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.top.equalTo(logOutLabel.snp.bottom).offset(8)
        }
        
        agreeButton.snp.makeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom).offset(32)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        
        disagreeButton.snp.makeConstraints { make in
            make.top.equalTo(agreeButton.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(backView)
        
        backView.snp.makeConstraints { make in
            make.height.equalTo(303)
            make.bottom.equalToSuperview()
            make.right.left.equalTo(view.safeAreaLayoutGuide)
        }
        
        view.backgroundColor = .black
//        view.layer.opacity = 0.4
      
    }
}
