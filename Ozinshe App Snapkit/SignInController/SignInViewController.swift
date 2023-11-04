//
//  ViewController.swift
//  Ozinshe App Snapkit
//
//  Created by Мерей Булатова on 01.11.2023.
//

import UIKit
import SnapKit
import SVProgressHUD
import Alamofire
import SwiftyJSON

class SignInViewController: UIViewController {
    
    let appView = AppView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConfigure()
        hideKeyboardWhenTappedAround()
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func signUpTapped() {
        let signUpViewController = SignUpViewController()
        
        navigationController?.show(signUpViewController, sender: self)
        navigationItem.title = ""
    }
    
    @objc func signInTapped() {
        print("tap")
    }
}


extension SignInViewController {
    
    func setupConfigure() {
        
        view.backgroundColor = .systemBackground
        
        let welcomeLabel = appView.textLabel(text: "Сәлем", 
                                             font: .boldSystemFont(ofSize: 24),
                                             color: UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1.00))
        view.addSubview(welcomeLabel)
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.left.equalToSuperview().inset(24)
        }
        
        
        let signInLabel = appView.textLabel(text: "Аккаунтқа кіріңіз", 
                                            font: UIFont.systemFont(ofSize: 16, weight: .regular),
                                            color: UIColor(red: 0.42, green: 0.45, blue: 0.50, alpha: 1.00))
        view.addSubview(signInLabel)
        
        signInLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).inset(0)
            make.left.equalToSuperview().inset(24)
        }
        
        
        let emailLabel = appView.textLabel(text: "Email", 
                                           font: UIFont.systemFont(ofSize: 14, weight: .bold),
                                           color: UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1.00))
        view.addSubview(emailLabel)
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(signInLabel.snp.bottom).offset(32)
            make.left.equalToSuperview().inset(24)
        }
        
        
        let emailTextField = appView.textField(placeholder: "Сіздің email",
                                               font:  UIFont.systemFont(ofSize: 16, weight: .regular),
                                               textColor: UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1.00),
                                               borderWidth: 1.0,
                                               borderColor: UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00),
                                               cornerRadius: 12.0)
        view.addSubview(emailTextField)
    
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(4)
            make.left.equalToSuperview().inset(24)
            make.right.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        
        
        let emailImage = appView.imageView(imageName: "email")
        view.addSubview(emailImage)
        
        emailImage.snp.makeConstraints { make in
            make.centerY.equalTo(emailTextField)
            make.leading.equalTo(emailTextField.snp.leading).inset(16)
        }
        
        
        let passwordLabel = appView.textLabel(text: "Құпиясөз",
                                              font: UIFont.systemFont(ofSize: 14, weight: .bold),
                                              color: UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1.00))
        view.addSubview(passwordLabel)
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(13)
            make.left.equalToSuperview().inset(24)
        }
        
        
        let passwordTextField = appView.textField(placeholder: "Сіздің құпия сөзіңіз",
                                                  font:  UIFont.systemFont(ofSize: 16, weight: .regular),
                                                  textColor: UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1.00),
                                                  borderWidth: 1.0,
                                                  borderColor: UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00),
                                                  cornerRadius: 12.0)
        view.addSubview(passwordTextField)
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(4)
            make.left.equalToSuperview().inset(24)
            make.right.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        
        
        let passwordImage = appView.imageView(imageName: "password")
        view.addSubview(passwordImage)
        
        passwordImage.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextField)
            make.leading.equalTo(passwordTextField.snp.leading).inset(16)
        }
        
        
        let showPasswordButton = appView.buttonImage(imageName: "showPassword")
        view.addSubview(showPasswordButton)
        
        showPasswordButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextField)
            make.right.equalTo(passwordTextField).inset(0)
            make.height.equalTo(56)
            make.width.equalTo(36)
        }
        
        
        let signInButton = appView.button(tintColor: .white, 
                                          setTitle: "Кіру",
                                          backgroundColor: UIColor(red: 0.49, green: 0.18, blue: 0.99, alpha: 1.00), 
                                          cornerRadius: 12)
                                          signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        view.addSubview(signInButton)
        
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(40)
            make.left.equalToSuperview().inset(24)
            make.right.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        
        
        let signUpButton = appView.button(setTitle: "Тіркелу", 
                                          font: .systemFont(ofSize: 14, weight: .semibold))
        signUpButton.setTitleColor(UIColor(red: 0.49, green: 0.18, blue: 0.99, alpha: 1.00), for: .normal)
        signUpButton.backgroundColor = .systemBackground
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        view.addSubview(signUpButton)
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(24)
            make.right.equalToSuperview().inset(24)
            make.height.equalTo(22)
            make.width.equalTo(65)
        }
        
        
        let questionLabel = appView.textLabel(text: "Аккаунтыңыз жоқ па?",
                                              font: .systemFont(ofSize: 14, weight: .semibold),
                                              color: UIColor(red: 0.42, green: 0.45, blue: 0.50, alpha: 1.00))
                                              questionLabel.textAlignment = .right
        view.addSubview(questionLabel)
        
        questionLabel.snp.makeConstraints { make in
            make.right.equalTo(signUpButton.snp.left)
            make.left.equalToSuperview().inset(24)
            make.top.equalTo(signInButton.snp.bottom).offset(26)
        }
    }
}
