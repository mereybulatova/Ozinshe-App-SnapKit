//
//  BannerCollectionViewCell.swift
//  Ozinshe App Snapkit
//
//  Created by Мерей Булатова on 04.11.2023.
//

import SnapKit
import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Add UI Elements
    let identifier = "BannerCell"
    
        let titleLabel = {
            let labelCell = UILabel()
            labelCell.text = "Қызғалдақтар мекені"
            labelCell.font = UIFont(name: "SFProDisplay-Bold", size: 14)
            labelCell.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1)
        
        return labelCell
    }()
    
        let subtitleLabel = {
            let label = UILabel()
            label.text = "Шытырман оқиғалы мультсериал Елбасының «Ұлы"
            label.font = UIFont(name: "SFProDisplay-Regular", size: 12)
            label.textColor = UIColor(red: 0.61, green: 0.64, blue: 0.69, alpha: 1)
        
        return label
    }()
    
        let image = {
            let imageView = UIImageView()
            
            imageView.image = UIImage(named: "bannerImage")
            imageView.layer.cornerRadius = 12
            imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let genreNameView = {
        
        let labelView = UIView()
        let label = UILabel()
        
        labelView.addSubview(label)
        
        labelView.backgroundColor = UIColor(red: 0.5, green: 0.18, blue: 0.99, alpha: 1)
        labelView.layer.cornerRadius = 8
        
        label.text = "Телехикая"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 12)
        label.textColor = .white
        
        label.snp.makeConstraints { make in
            make.top.equalTo(labelView.snp.top)
            make.bottom.equalTo(labelView.snp.bottom)
            make.right.equalToSuperview().inset(8)
            make.left.equalToSuperview().inset(8)
        }
        
        return labelView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        
        //MARK: - Add subviews
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(image)
        addSubview(genreNameView)
        
        //MARK: - Constraints
        image.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.top.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(image.snp.bottom).offset(16)
    }
        
        subtitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.bottom.equalToSuperview()
        }
        
        genreNameView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.left.equalToSuperview().inset(8)
            make.height.equalTo(24)
        }
    }
}
