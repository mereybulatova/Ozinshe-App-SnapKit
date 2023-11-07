//
//  SeasonsAndSeriesViewController.swift
//  Ozinshe App Snapkit
//
//  Created by Мерей Булатова on 06.11.2023.
//

import UIKit

class SeasonsAndSeriesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate {

    let seriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 24.0, left: 24.0, bottom: 8.0, right: 24.0)
        layout.itemSize = CGSize(width: 115, height: 34)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SeasonsAndSeriesCollectionViewCell.self, forCellWithReuseIdentifier: "SeasonCell")
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    let seriesTableView: UITableView = {
       let tv = UITableView()
        tv.separatorStyle = .none
        tv.allowsSelection = true
        tv.showsVerticalScrollIndicator = false
        tv.showsHorizontalScrollIndicator = false
        
        //Регистрация table view cell
        tv.register(SeasonSeriesTableViewCell.self, forCellReuseIdentifier: "SeriesCell")
        
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        seriesCollectionView.dataSource = self
        seriesCollectionView.delegate = self
        
        seriesTableView.dataSource = self
        seriesTableView.delegate = self
        
        view.backgroundColor = .systemBackground
        setupUI()

    }
    
    func setupUI() {
        
        view.addSubview(seriesCollectionView)
        view.addSubview(seriesTableView)
        
        seriesCollectionView.snp.makeConstraints { make in
            make.top.right.left.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(74)
        }
        
        seriesTableView.snp.makeConstraints { make in
            make.bottom.right.left.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(seriesCollectionView.snp.bottom)
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeasonCell", for: indexPath) as! SeasonsAndSeriesCollectionViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SeriesCell", for: indexPath) as! SeasonSeriesTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 240
    }
    

}
