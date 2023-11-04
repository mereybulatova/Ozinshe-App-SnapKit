//
//  SearchCollectionViewCell.swift
//  Ozinshe App Snapkit
//
//  Created by Мерей Булатова on 03.11.2023.
//

import UIKit
import SnapKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    let identifier = "SearchCollectionViewCell"
    
    private let label: UILabel = {
        let labelCell = UILabel()
        labelCell.text = "MereyTheBest"
        labelCell.font = UIFont(name: "SFProDisplay-Semibold", size: 12)
        labelCell.textColor = UIColor(red: 0.216, green: 0.255, blue: 0.318, alpha: 1)
        
        return labelCell
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        backgroundColor = UIColor(red: 0.898, green: 0.906, blue: 0.922, alpha: 1)
        layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
    addSubview(label)
    
    label.snp.makeConstraints { make in
        make.left.equalTo(contentView.snp.left).inset(16)
        make.right.equalTo(contentView.snp.right).inset(16)
        make.top.equalTo(contentView.snp.top)
        make.bottom.equalTo(contentView.snp.bottom)
        make.height.equalTo(34)
    }
    
  }
    
}
