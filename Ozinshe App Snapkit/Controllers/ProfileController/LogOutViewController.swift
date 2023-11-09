//
//  LogOutViewController.swift
//  Ozinshe App Snapkit
//
//  Created by Мерей Булатова on 07.11.2023.
//

import UIKit
import SnapKit

class LogOutViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var viewTranslation = CGPoint(x: 0, y: 0)
    
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
        agreeButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        agreeButton.layer.cornerRadius = 12
        
        let disagreeButton = UIButton()
        disagreeButton.setTitle("Жоқ", for: .normal)
        disagreeButton.setTitleColor(UIColor(red: 0.329, green: 0.082, blue: 0.776, alpha: 1), for: .normal)
        disagreeButton.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        disagreeButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
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
        
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        
        view.addSubview(backView)
        
        backView.snp.makeConstraints { make in
            make.height.equalTo(303)
            make.bottom.equalToSuperview()
            make.right.left.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func tapGest() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        tap.delegate = self
        view.addGestureRecognizer(tap)
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDismiss)))
    }
    
    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func handleDismiss(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .changed:
            viewTranslation = sender.translation(in: view)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.backView.transform = CGAffineTransform(translationX: 0, y: self.viewTranslation.y)
            })
        case .ended:
            if viewTranslation.y < 100 {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.backView.transform = .identity
                })
            } else {
                dismiss(animated: true, completion: nil)
            }
        default:
            break
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: backView))! {
            return false
        }
        return true
    }
    
    @objc func logoutButtonTapped() {
        UserDefaults.standard.removeObject(forKey: "accessToken")
        
        let rootVC = SignInViewController()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = rootVC
        appDelegate.window?.makeKeyAndVisible()
    }
    
    @objc func cancelButtonTapped() {
        dismissView()
    }
}
