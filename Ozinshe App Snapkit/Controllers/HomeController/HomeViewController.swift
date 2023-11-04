//
//  HomeViewController.swift
//  Ozinshe App Snapkit
//
//  Created by Мерей Булатова on 01.11.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
        let tableView = {
        let tableView = UITableView()
        
            tableView.separatorStyle = .none
            tableView.allowsSelection = true
            tableView.showsVerticalScrollIndicator = false
            tableView.showsHorizontalScrollIndicator = false
            
            tableView.register(MainBannerTableViewCell.self, forCellReuseIdentifier: "MainBannerCell")
            tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: "HistoryCell")
            tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainCell")
            tableView.register(GenreTableViewCell.self, forCellReuseIdentifier: "GenreCell")
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        view.backgroundColor = .systemBackground
    }
    
    func setupUI() {
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 4
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainBannerCell", for: indexPath) as! MainBannerTableViewCell
            
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as! HistoryTableViewCell
            
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainTableViewCell
            
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GenreCell", for: indexPath) as! GenreTableViewCell
            
            return cell
        }
       return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        if indexPath.row == 0 {
            return 272
        } else if indexPath.row == 1 {
            return 228
        } else if indexPath.row == 2 {
            return 288
        } else if indexPath.row == 3 {
            return 184
        }
        return UITableView.automaticDimension
    }
    
}
