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
    
    let backView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.9, green: 0.91, blue: 0.92, alpha: 1)
        view.layer.cornerRadius = 8
        return view
    }()
    
    let label: UILabel = {
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
        contentView.addSubview(backView)
        backView.addSubview(label)
        
        backView.snp.makeConstraints { make in
            make.edges.equalTo(contentView.safeAreaLayoutGuide)
        }
    
        label.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(16)
            make.bottom.top.equalToSuperview()
            make.height.equalTo(34)
    }
  }
}
