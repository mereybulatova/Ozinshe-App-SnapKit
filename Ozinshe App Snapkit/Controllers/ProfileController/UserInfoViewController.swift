//
//  UserInfoViewController.swift
//  Ozinshe App Snapkit
//
//  Created by Мерей Булатова on 07.11.2023.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    let yourNameLabel = {
        let label = UILabel()
        label.text = "Сіздің атыңыз"
        label.textColor = UIColor(red: 0.612, green: 0.639, blue: 0.686, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        
        return label
    }()
    
    let nameTextField = {
        let textField = UITextField()
        textField.placeholder = "Атыңынызды енгізіңіз..."
        textField.textColor = UIColor(red: 0.067, green: 0.094, blue: 0.153, alpha: 1)
        textField.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        
        return textField
    }()
    
    let grayView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.82, green: 0.835, blue: 0.859, alpha: 1)
        
        return view
    }()
    
    let emailLabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = UIColor(red: 0.612, green: 0.639, blue: 0.686, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        
        return label
    }()
    
    let emailTextField = {
        let textField = UITextField()
        textField.placeholder = "ali@gmail.com"
        textField.textColor = UIColor(red: 0.067, green: 0.094, blue: 0.153, alpha: 1)
        textField.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        
        return textField
    }()
    
    let grayView2 = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.82, green: 0.835, blue: 0.859, alpha: 1)
        
        return view
    }()
    
    let phoneLabel = {
        let label = UILabel()
        label.text = "Телефон"
        label.textColor = UIColor(red: 0.612, green: 0.639, blue: 0.686, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        
        return label
    }()
    
    let phoneTextField = {
        let textField = UITextField()
        textField.placeholder = "+7 702 732-10-31"
        textField.textColor = UIColor(red: 0.067, green: 0.094, blue: 0.153, alpha: 1)
        textField.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        
        return textField
    }()
    
    let grayView3 = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.82, green: 0.835, blue: 0.859, alpha: 1)
        
        return view
    }()
    
    let birthLabel = {
        let label = UILabel()
        label.text = "Туылған күні"
        label.textColor = UIColor(red: 0.612, green: 0.639, blue: 0.686, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        
        return label
    }()
    
    let birthTextField = {
        let textField = UITextField()
        textField.placeholder = "2005-01-28"
        textField.textColor = UIColor(red: 0.067, green: 0.094, blue: 0.153, alpha: 1)
        textField.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        
        return textField
    }()
    
    let grayView4 = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.82, green: 0.835, blue: 0.859, alpha: 1)
        
        return view
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
      
        setupUI()
        view.backgroundColor = .systemBackground
    }
    
    func setupUI() {
        view.addSubview(yourNameLabel)
        view.addSubview(nameTextField)
        view.addSubview(grayView)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(grayView2)
        view.addSubview(phoneLabel)
        view.addSubview(phoneTextField)
        view.addSubview(grayView3)
        view.addSubview(birthLabel)
        view.addSubview(birthTextField)
        view.addSubview(grayView4)
        view.addSubview(saveChangesButton)
        
        yourNameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.left.equalToSuperview().inset(24)
            make.height.equalTo(21)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(yourNameLabel.snp.bottom)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(33)
        }
        
        grayView.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(grayView.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(24)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(24)
        }
        
        grayView2.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(12)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
        
        phoneLabel.snp.makeConstraints { make in
            make.top.equalTo(grayView2.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(24)
        }
        
        phoneTextField.snp.makeConstraints { make in
            make.top.equalTo(phoneLabel.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(24)
        }
        
        grayView3.snp.makeConstraints { make in
            make.top.equalTo(phoneTextField.snp.bottom)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
        
        birthLabel.snp.makeConstraints { make in
            make.top.equalTo(grayView3.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(24)
        }
        
        birthTextField.snp.makeConstraints { make in
            make.top.equalTo(birthLabel.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(24)
        }
        
        grayView4.snp.makeConstraints { make in
            make.top.equalTo(birthTextField.snp.bottom).offset(12)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
        
        saveChangesButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.height.equalTo(56)
        }
    }
}
