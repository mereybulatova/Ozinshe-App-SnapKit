//
//  OnboardingView.swift
//  Ozinshe App Snapkit
//
//  Created by Мерей Булатова on 08.11.2023.
//

import UIKit

class OnboardingView: UIView {
    var navigationController: UINavigationController?
    
    let imageO: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "firstSlide")
        
        return image
    }()
    
    let welcomeLabel = {
        let label = UILabel()
        label.text = "ÖZINŞE-ге қош келдің!"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        label.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1)
        label.textAlignment = .center
        
        return label
    }()
    
    let fullInfoLabel = {
        let label = UILabel()
        label.text = "Фильмдер, телехикаялар, ситкомдар, анимациялық жобалар, телебағдарламалар мен реалити-шоулар, аниме және тағы басқалары"
        label.font = UIFont(name: "SFProDisplay-Semibold", size: 14)
        label.textColor = UIColor(red: 0.42, green: 0.447, blue: 0.502, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 6
        
        return label
    }()
    
    let nextButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.5, green: 0.18, blue: 0.99, alpha: 1)
        button.setTitle("Әрі қарай", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        button.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 12
        
        return button
    }()
    
    let skipButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        button.setTitle("Өткізу", for: .normal)
        button.setTitleColor(UIColor(red: 0.067, green: 0.094, blue: 0.153, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 12)
        button.layer.cornerRadius = 8
        button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        button.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func skipButtonTapped() {
        let signInVC = SignInViewController()
        
        signInVC.modalPresentationStyle = .fullScreen
        
        navigationController?.show(signInVC, sender: self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setPageElements(image: UIImage, text: String, subtitleText: String, nextButtonB: Bool, skipButtonB: Bool) {
        imageO.image = image
        welcomeLabel.text = text
        fullInfoLabel.text = subtitleText
        nextButton.isHidden = nextButtonB
        skipButton.isHidden = skipButtonB
    }
    
    public func setPageElementsTransform(transform: CGAffineTransform) {
//        imageO.transform = transform
        welcomeLabel.transform = transform
        fullInfoLabel.transform = transform
        nextButton.transform = transform
        skipButton.transform = transform
    }
    
    func setupUI() {
      
        addSubview(imageO)
        addSubview(welcomeLabel)
        addSubview(fullInfoLabel)
        addSubview(nextButton)
        addSubview(skipButton)
    
        imageO.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview()
            make.height.equalTo(504)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalTo(imageO.snp.bottom).inset(2)
        }
        
        fullInfoLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(32)
            make.top.equalTo(welcomeLabel.snp.bottom).offset(24)
        }
        
        nextButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().inset(50)
            make.height.equalTo(56)
        }
        
        skipButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(24)
            make.top.equalToSuperview().offset(60)
            make.size.equalTo(CGSize(width: 69, height: 24))
        }
    }
}
