//
//  AppView.swift
//  Ozinshe App Snapkit
//
//  Created by Мерей Булатова on 01.11.2023.
//

import Foundation
import UIKit

class AppView {
    
    //MARK: - Label
    func textLabel(text: String,
                   font: UIFont = UIFont(name: "SFProDisplay-Bold", size: 16.0)!,
                   color: UIColor = .black) -> UILabel {
        
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = color
        return label
    }
    
    //MARK: - Button with image
    func buttonImage( imageName: String,
                    cornerRadius: CGFloat = 0) -> UIButton {
        
        let buttonImage = UIButton()
        buttonImage.setImage(UIImage(named: imageName), for: .normal)
        buttonImage.layer.cornerRadius = cornerRadius
        return buttonImage
    }

    //MARK: - Button without image
    func button(tintColor: UIColor = .black,

                setTitle: String,
                font: UIFont = .systemFont(ofSize: 14, weight: .regular),
                backgroundColor: UIColor = .white,
                cornerRadius: CGFloat = 0) -> UIButton {
        
        let button = UIButton()
        button.tintColor = tintColor
        button.setTitle(setTitle, for: .normal)
        button.titleLabel?.font = font
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = cornerRadius
        return button
    }
    
    //MARK: - ImageView
    func imageView(imageName: String,
                   tintColor: UIColor = .gray,
                   contentMode: UIView.ContentMode = .scaleAspectFit) -> UIImageView {
        
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.tintColor = tintColor
        imageView.contentMode = contentMode
        return imageView
    }
    
    //MARK: - View
    func view(backgroundColor: UIColor = .white,
              cornerRadius: CGFloat = 0) -> UIView {
        
        let view = UIView()
        view.backgroundColor = backgroundColor
        view.layer.cornerRadius = cornerRadius
        return view
    }
    
    //MARK: - Text Field
    func textField(placeholder: String,
                   font: UIFont = .systemFont(ofSize: 16, weight: .regular),
                   textColor: UIColor = .black,
                   borderWidth: CGFloat = 1.0,
                   borderColor: UIColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00),
                   cornerRadius: CGFloat = 12.0) -> UITextField {
        
        let textField = TextFieldWithPadding()
        textField.placeholder = placeholder
        textField.font = font
        textField.textColor = textColor
        textField.layer.borderWidth = borderWidth
        textField.layer.borderColor = borderColor.cgColor
        textField.layer.cornerRadius = cornerRadius
        return textField
    }
    
    //MARK: - Table View
    
    
}
