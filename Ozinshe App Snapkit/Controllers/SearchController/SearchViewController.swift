//
//  SearchViewController.swift
//  Ozinshe App Snapkit
//
//  Created by Мерей Булатова on 01.11.2023.
//

import UIKit
import SnapKit
import SVProgressHUD
import Alamofire
import SwiftyJSON

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
    
    var categories: [Category] = []
    
    var movies: [Movie] = []
    
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
        exitBut.addTarget(self, action: #selector(clearTextField), for: .touchUpInside)
        
        return exitBut
    }()
    
        let searchButton = {
        let searchBut = UIButton()
        
        searchBut.setImage(UIImage(named: "searchVC"), for: .normal)
        searchBut.contentMode = .scaleToFill
            searchBut.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        
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
        layout.itemSize = CGSize(width: 128, height: 34)
        
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
        tv.register(MovieTableViewCell.self, forCellReuseIdentifier: "SearchTableCell")
        
        return tv
    }()
    
    let tableViewToCollectionConstraint = {
        let constraints = NSLayoutConstraint()
        return constraints
    }()
    
    let tableViewToLabelConstraint = {
        let constraints = NSLayoutConstraint()
        return constraints
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
        exitButton.isHidden = true
        hideKeyboardWhenTappedAround()
        downloadCategories()
        
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
    
    @objc func clearTextField() {
        searchTextField.text = ""
        downloadSearchMovies()
    }
    
    @objc func searchButtonTapped() {
        downloadSearchMovies()
    }
    
    func downloadSearchMovies() {
        if searchTextField.text!.isEmpty {
            titleLabel.text = "Cанаттар"
            collectionView.isHidden = false
//            tableViewToLabelConstraint.priority = .defaultLow
//            tableViewToCollectionConstraint.priority = .defaultHigh
            tableView.isHidden = true
            movies.removeAll()
            tableView.reloadData()
            exitButton.isHidden = true
            return
        } else {
            titleLabel.text = "Іздеу нәтижелері"
            collectionView.isHidden = true
//            tableViewToLabelConstraint.priority = .defaultHigh
//            tableViewToCollectionConstraint.priority = .defaultLow
            tableView.isHidden = false
            exitButton.isHidden = false
        }
        
        SVProgressHUD.show()
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(Storage.sharedInstance.accessToken)"]
        
        let parametres = ["search": searchTextField.text!]
        
        AF.request(Urls.SEARCH_MOVIES_URL, method: .get, parameters: parametres, headers: headers).responseData { response in
            
            SVProgressHUD.dismiss()
            var resultString = ""
            if let data = response.data {
                resultString = String(data: data, encoding: .utf8)!
                print(resultString)
            }
            
            if response.response?.statusCode == 200 {
                let json = JSON(response.data!)
                print("JSON: \(json)")
                
                if let array = json.array {
                    self.movies.removeAll()
                    self.tableView.reloadData()
                    for item in array {
                        let movie = Movie(json: item)
                        self.movies.append(movie)
                    }
                    self.tableView.reloadData()
                    
                } else {
                    SVProgressHUD.showError(withStatus: "CONNECTION_ERROR".localized())
                }
            } else {
                var ErrorString = "CONNECTION_ERROR".localized()
                if let sCode = response.response?.statusCode {
                    ErrorString = ErrorString + "\(sCode)"
                }
                ErrorString = ErrorString + "\(resultString)"
                SVProgressHUD.showError(withStatus: "\(ErrorString)")
            }
        }
    }
    
    func downloadCategories() {
               SVProgressHUD.show()
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(Storage.sharedInstance.accessToken)"]
        
        AF.request(Urls.CATEGORIES_URL, method: .get, headers: headers).responseData { response in
            
            SVProgressHUD.dismiss()
            var resultString = ""
            if let data = response.data {
                resultString = String(data: data, encoding: .utf8)!
                print(resultString)
            }
            
            if response.response?.statusCode == 200 {
                let json = JSON(response.data!)
                print("JSON: \(json)")
                
                if let array = json.array {
                    for item in array {
                        let category = Category(json: item)
                        self.categories.append(category)
                    }
                    self.collectionView.reloadData()
                } else {
                    SVProgressHUD.showError(withStatus: "CONNECTION_ERROR".localized())
                }
            } else {
                var ErrorString = "CONNECTION_ERROR".localized()
                if let sCode = response.response?.statusCode {
                    ErrorString = ErrorString + "\(sCode)"
                }
                ErrorString = ErrorString + "\(resultString)"
                SVProgressHUD.showError(withStatus: "\(ErrorString)")
            }
        }
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
            make.right.left.equalToSuperview()
//            make.bottom.equalTo(tableView)
            make.height.equalTo(340)
        }
        
    }
}


extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableCell", for: indexPath) as! MovieTableViewCell
        
        cell.setData(movie: movies[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 153.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieinfoVC = MovieInfoController()
        
        movieinfoVC.movie = movies[indexPath.row]
        
        navigationController?.show(movieinfoVC, sender: self)
    }
    
    //MARK: - Collection view data source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
        
        cell.label.text = categories[indexPath.row].name
        
        cell.backView.layer.cornerRadius = 8
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let categoryTableViewController = tableView.dequeueReusableCell(withIdentifier: "SearchTableCell", for: indexPath) as! CategoryTableViewController
        categoryTableViewController.categoryID = categories[indexPath.row].id
        categoryTableViewController.categoryName = categories[indexPath.row].name
        
        navigationController?.show(categoryTableViewController, sender: self)
    }
}

//MARK: - UITextFieldDelegate extension
extension SearchViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == searchTextField {
            searchTextField.layer.borderColor = UIColor(red: 0.59, green: 0.33, blue: 0.94, alpha: 1.00).cgColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == searchTextField {
            searchTextField.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
        }
    }
    
    func textFieldDidChanged(_ textField: UITextField) {
        downloadSearchMovies()
    }
}


