//
//  ChangePasswordViewController.swift
//  Ozinshe App Snapkit
//
//  Created by Мерей Булатова on 07.11.2023.
//

import UIKit

class ChangePasswordViewController: UIViewController {

    let passwordLabel = {
        let label = UILabel()
        label.text = "Құпиясөз"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        label.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1.00)
        
        return label
    }()
    
    let passwordTextField = {
        let textField = TextFieldWithPadding()
        textField.placeholder = "Сіздің құпия сөзіңіз"
        textField.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1.00)
        textField.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 12
        
        return textField
    }()
    
    let passwordImage = {
        let image = UIImageView()
        image.image = UIImage(named: "password")
        
        return image
    }()
    
    let showPasswordButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "showPassword"), for: .normal)
        
        return button
    }()
    
    let repeatPasswordLabel = {
        let label = UILabel()
        label.text = "Құпиясөзді қайталаңыз"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        label.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1.00)
        
        return label
    }()
    
    let repeatPasswordTextField = {
        let textField = TextFieldWithPadding()
        textField.placeholder = "Сіздің құпия сөзіңіз"
        textField.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1.00)
        textField.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 12
        
        return textField
    }()
    
    let repeatPasswordImage = {
        let image = UIImageView()
        image.image = UIImage(named: "password")
        
        return image
    }()
    
    let repeatShowPasswordButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "showPassword"), for: .normal)
        
        return button
    }()
    
    let saveChangesButton = {
        let button = UIButton()
        button.setTitle("Өзгерістерді сақтау", for: .normal)
        button.backgroundColor = UIColor(red: 0.5, green: 0.18, blue: 0.99, alpha: 1)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        button.layer.cornerRadius = 12
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordImage)
        view.addSubview(showPasswordButton)
        view.addSubview(repeatPasswordLabel)
        view.addSubview(repeatPasswordTextField)
        view.addSubview(repeatPasswordImage)
        view.addSubview(repeatShowPasswordButton)
        view.addSubview(saveChangesButton)
        
        passwordLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(21)
            make.height.equalTo(21)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(4)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        
        passwordImage.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 20, height: 20))
            make.left.equalTo(passwordTextField.snp.left).offset(16)
            make.centerY.equalTo(passwordTextField)
        }
        
        showPasswordButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 36, height: 56))
            make.right.equalTo(passwordTextField.snp.right)
            make.centerY.equalTo(passwordTextField)
        }
        
        repeatPasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(21)
            make.left.equalToSuperview().inset(24)
            make.height.equalTo(21)
        }
        
        repeatPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(repeatPasswordLabel.snp.bottom).offset(4)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        
        repeatPasswordImage.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 20, height: 20))
            make.left.equalTo(repeatPasswordTextField.snp.left).offset(16)
            make.centerY.equalTo(repeatPasswordTextField)
        }
        
        repeatShowPasswordButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 36, height: 56))
            make.right.equalTo(repeatPasswordTextField.snp.right)
            make.centerY.equalTo(repeatPasswordTextField)
        }
        
        saveChangesButton.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(24)
            make.height.equalTo(56)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
        }
    }
}
