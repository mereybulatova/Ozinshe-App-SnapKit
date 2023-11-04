//
//  ProfileViewController.swift
//  Ozinshe App Snapkit
//
//  Created by Мерей Булатова on 01.11.2023.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    //MARK: - Add UI Elements
    let profileImageView = {
        let profImageView = UIImageView()
        
        profImageView.image = UIImage(named: "avatar")
        
        return profImageView
    }()
    
    let profileLabel = {
        let label = UILabel()
        
        label.text = "My Profile"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        label.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1)
        
        return label
    }()
    
    let subtitleProfileLabel = {
        let label = UILabel()
        
        label.text = "ali@gmail.com"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.textColor = UIColor(red: 0.612, green: 0.639, blue: 0.686, alpha: 1)
        
        return label
    }()
    
    //MARK: - Language Button Elements
    let languageButton = {
        let button = UIButton()
        
        button.setTitle("Language", for: .normal)
        button.setTitleColor(UIColor(red: 0.067, green: 0.094, blue: 0.153, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        button.contentHorizontalAlignment = .left
        
        return button
    }()
    
    let languageLabel = {
        let label = UILabel()
        
        label.text = "English"
        label.textColor = UIColor(red: 0.612, green: 0.639, blue: 0.686, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Semibold", size: 12)
        
        return label
    }()
    
    let languageArrowImage = {
        let arrowImage = UIImageView()
        
        arrowImage.image = UIImage(named: "profileArrow")
        
        return arrowImage
    }()
    
    let languageCellView = {
        let cell = UIView()
        
        cell.backgroundColor = UIColor(red: 0.82, green: 0.84, blue: 0.86, alpha: 1.00)
        
        return cell
    }()
    
    //MARK: - User Info Button Elements
    let userInfoButton = {
        let button = UIButton()
        
        button.setTitle("Personal Information", for: .normal)
        button.setTitleColor(UIColor(red: 0.067, green: 0.094, blue: 0.153, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        button.contentHorizontalAlignment = .left
        
        return button
    }()
    
    let userInfoLabel = {
        let label = UILabel()
        
        label.text = "Edit"
        label.textColor = UIColor(red: 0.612, green: 0.639, blue: 0.686, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Semibold", size: 12)
        
        return label
    }()
    
    let userInfoArrowImage = {
        let arrowImage = UIImageView()
        
        arrowImage.image = UIImage(named: "profileArrow")
        
        return arrowImage
    }()
    
    let userInfoCellView = {
        let cell = UIView()
        
        cell.backgroundColor = UIColor(red: 0.82, green: 0.84, blue: 0.86, alpha: 1.00)
        
        return cell
    }()
    
    //MARK: - Change Password Button Elements
    let passwordEditButton = {
        let button = UIButton()
        
        button.setTitle("Change Password", for: .normal)
        button.setTitleColor(UIColor(red: 0.067, green: 0.094, blue: 0.153, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        button.contentHorizontalAlignment = .left
        
        return button
    }()
    
    let passwordArrowImage = {
        let arrowImage = UIImageView()
        
        arrowImage.image = UIImage(named: "profileArrow")
        
        return arrowImage
    }()
    
    let passwordCellView = {
        let cell = UIView()
        
        cell.backgroundColor = UIColor(red: 0.82, green: 0.84, blue: 0.86, alpha: 1.00)
        
        return cell
    }()
    
    //MARK: - Dark Mode Elements
    let darkModeLabel = {
        let label = UILabel()
        
        label.text = "Dark Mode"
        label.textColor = UIColor(red: 0.067, green: 0.094, blue: 0.153, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        
        return label
    }()
    
    let darkModeSwitch = {
        let dMSwitch = UISwitch()
        
        dMSwitch.onTintColor = UIColor(red: 0.702, green: 0.463, blue: 0.969, alpha: 1)
        dMSwitch.thumbTintColor = UIColor(red: 0.9, green: 0.91, blue: 0.92, alpha: 1)
        
        return dMSwitch
    }()
    
    let logOutButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "profile"), for: .normal)
    
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        view.backgroundColor = .systemBackground
        navigationController?.title = "Profile"
    }
    
    func setupUI() {
        
        //MARK: - Add subviews
        view.addSubview(profileImageView)
        view.addSubview(profileLabel)
        view.addSubview(subtitleProfileLabel)
        view.addSubview(languageLabel)
        view.addSubview(languageButton)
        view.addSubview(languageArrowImage)
        view.addSubview(languageCellView)
        view.addSubview(userInfoLabel)
        view.addSubview(userInfoButton)
        view.addSubview(userInfoArrowImage)
        view.addSubview(userInfoCellView)
        view.addSubview(passwordArrowImage)
        view.addSubview(passwordEditButton)
        view.addSubview(passwordCellView)
        view.addSubview(darkModeLabel)
        view.addSubview(darkModeSwitch)
        
        //MARK: - Constraints
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(32)
            make.centerX.equalToSuperview()
        }
        
        profileLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }
        
        subtitleProfileLabel.snp.makeConstraints { make in
            make.top.equalTo(profileLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        
        languageButton.snp.makeConstraints { make in
            make.top.equalTo(subtitleProfileLabel.snp.bottom).offset(24)
            make.bottom.equalTo(languageCellView.snp.top).offset(1)
            make.left.equalToSuperview().inset(24)
            make.right.equalToSuperview().inset(24)
            make.height.equalTo(64)
        }
        
        languageArrowImage.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(24)
            make.height.equalTo(16)
            make.width.equalTo(16)
            make.left.equalTo(languageLabel.snp.right).offset(8)
            make.centerY.equalTo(languageButton)
        }
        
        languageLabel.snp.makeConstraints { make in
            make.centerY.equalTo(languageButton)
        }
        
        languageCellView.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(24)
            make.left.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
        
        userInfoButton.snp.makeConstraints { make in
            make.top.equalTo(languageCellView.snp.bottom).inset(1)
            make.left.equalToSuperview().inset(24)
            make.right.equalToSuperview().inset(24)
            make.height.equalTo(64)
        }
        
        userInfoArrowImage.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(24)
            make.height.equalTo(16)
            make.width.equalTo(16)
            make.left.equalTo(userInfoLabel.snp.right).offset(8)
            make.centerY.equalTo(userInfoButton)
        }
        
        userInfoLabel.snp.makeConstraints { make in
            make.centerY.equalTo(userInfoButton)
        }
        
        userInfoCellView.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(24)
            make.left.equalToSuperview().inset(24)
            make.height.equalTo(1)
            make.top.equalTo(userInfoButton.snp.bottom).inset(1)
        }
        
        passwordEditButton.snp.makeConstraints { make in
            make.top.equalTo(userInfoCellView.snp.bottom).offset(1)
            make.left.equalToSuperview().inset(24)
            make.right.equalToSuperview().inset(24)
            make.height.equalTo(64)
        }
        
        passwordArrowImage.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(24)
            make.height.equalTo(16)
            make.width.equalTo(16)
            make.centerY.equalTo(passwordEditButton)
        }
        
        passwordCellView.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(24)
            make.left.equalToSuperview().inset(24)
            make.height.equalTo(1)
            make.top.equalTo(passwordEditButton.snp.bottom).inset(1)
        }
        
        darkModeLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordCellView.snp.bottom).offset(25)
            make.left.equalToSuperview().inset(24)
            make.centerX.equalTo(darkModeSwitch)
        }
        
        darkModeSwitch.snp.makeConstraints { make in
            make.top.equalTo(passwordCellView.snp.bottom).offset(20)
            make.right.equalToSuperview().inset(24)
        }
    }
}
