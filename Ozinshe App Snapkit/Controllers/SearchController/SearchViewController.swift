//
//  SearchViewController.swift
//  Ozinshe App Snapkit
//
//  Created by Мерей Булатова on 01.11.2023.
//

import UIKit
import SnapKit

class LeftAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        
        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0
        attributes?.forEach { layoutAttribute in
            guard layoutAttribute.representedElementCategory == .cell else {
                return
            }
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }
            
            layoutAttribute.frame.origin.x = leftMargin
            
            leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
            maxY = max(layoutAttribute.frame.maxY , maxY)
        }
        
        return attributes
    }
}

class SearchViewController: UIViewController {
    
    //MARK: - Add UI Elements
        let searchTextField = {
        let searchTF = TextFieldWithPadding()
        
        searchTF.padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        searchTF.placeholder = "Іздеу"
        searchTF.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        searchTF.textColor = UIColor(red: 0.612, green: 0.639, blue: 0.686, alpha: 1)
        searchTF.layer.borderWidth = 1.0
        searchTF.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
        searchTF.layer.cornerRadius = 12.0
        
        return searchTF
    }()
    
        let exitButton = {
        let exitBut = UIButton()
        
        exitBut.setImage(UIImage(named: "exitButton"), for: .normal)
        exitBut.contentMode = .scaleToFill
        
        return exitBut
    }()
    
        let searchButton = {
        let searchBut = UIButton()
        
        searchBut.setImage(UIImage(named: "searchVC"), for: .normal)
        searchBut.contentMode = .scaleToFill
        
        return searchBut
    }()
    
        let titleLabel = {
        let label = UILabel()
        
        label.text = "Санаттар"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        label.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1)
        
        return label
    }()
    
        let collectionView: UICollectionView = {
        let layout = LeftAlignedCollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16.0, left: 24.0, bottom: 16.0, right: 24.0)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 8
        layout.itemSize = CGSize(width: 107, height: 34)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        
        return collectionView
    }()
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.allowsSelection = true
        tv.showsVerticalScrollIndicator = false
        tv.showsHorizontalScrollIndicator = false
        
        //Регистрация table view cell
        tv.register(MainBannerTableViewCell.self, forCellReuseIdentifier: "MainBannerCell")
        
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - Collection View
        collectionView.dataSource = self
        collectionView.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //MARK: - UI Elements
        view.backgroundColor = .systemBackground
        hideKeyboardWhenTappedAround()
        
        //MARK: - Constraints
        addViews()
        
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func addViews() {
        view.addSubview(exitButton)
        view.addSubview(searchButton)
        view.addSubview(searchTextField)
        view.addSubview(titleLabel)
        view.addSubview(collectionView)
        view.addSubview(tableView)
        
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.left.equalToSuperview().inset(24)
            make.right.equalToSuperview().inset(96)
            make.height.equalTo(56)
            make.width.equalTo(255)
        }
        
        exitButton.snp.makeConstraints { make in
            
            make.height.equalTo(52)
            make.width.equalTo(52)
            make.right.equalTo(searchTextField.snp.right).offset(0)
            make.centerY.equalTo(searchTextField)
        }
        
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.right.equalToSuperview().inset(24)
            make.width.equalTo(56)
            make.height.equalTo(56)
            
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24)
            make.top.equalTo(searchTextField.snp.bottom).offset(35)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        tableView.snp.makeConstraints { make in
            make.right.left.bottom.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(collectionView)
            make.top.equalTo(titleLabel.snp.bottom).inset(10)
            
        }
    }
}


extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
        
        return cell
    }
}


