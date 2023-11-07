//
//  MovieInfoController.swift
//  Ozinshe App Snapkit
//
//  Created by Мерей Булатова on 05.11.2023.
//

import UIKit
import SnapKit

class MovieInfoController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(movieScrollView)
        
        movieScrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.right.left.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    var movieScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.indicatorStyle = .default
            scrollView.contentMode = .scaleToFill
            scrollView.bounces = false
            scrollView.contentInsetAdjustmentBehavior = .never
            scrollView.bouncesZoom = false
        
    //MARK: - UI View
    let movieContentView = {
        let view = UIView()
        view.contentMode = .scaleToFill
        view.backgroundColor = .systemBackground
   
        let posterImageView = UIImageView()
        posterImageView.image = UIImage(named: "posterImage")
    
        let arrowButton = UIButton()
        arrowButton.setImage(UIImage(named: "backArrow"), for: .normal)
    
        let playButton = UIButton()
        playButton.setImage(UIImage(named: "playButton"), for: .normal)
    
        let shareButton = UIButton()
        shareButton.setImage(UIImage(named: "shareButton"), for: .normal)
    
        let favoriteButton = UIButton()
        favoriteButton.setImage(UIImage(named: "favoriteButton"), for: .normal)
    
        let favoriteButtonLabel = UILabel()
        favoriteButtonLabel.text = "Тізімге қосу"
        favoriteButtonLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 12)
        favoriteButtonLabel.textColor = UIColor(red: 0.82, green: 0.835, blue: 0.859, alpha: 1)
    
        let shareButtonLabel = UILabel()
        shareButtonLabel.text = "Бөлісу"
        shareButtonLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 12)
        shareButtonLabel.textColor = UIColor(red: 0.82, green: 0.835, blue: 0.859, alpha: 1)
    
        //MARK: - Background View
    let backgroundView = {
        let view = UIView()
        view.contentMode = .scaleToFill
        view.layer.cornerRadius = 32
        view.clipsToBounds = true
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        let nameLabel = UILabel()
        nameLabel.text = "Айдар"
        nameLabel.textColor = UIColor(red: 0.067, green: 0.094, blue: 0.153, alpha: 1)
        nameLabel.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        
        let detailLabel = UILabel()
        detailLabel.text = "2020 • Телехикая • 5 сезон, 46 серия, 7 мин"
        detailLabel.textColor = UIColor(red: 0.612, green: 0.639, blue: 0.686, alpha: 1)
        detailLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 12)
        
        let grayView1 = UIView()
        grayView1.backgroundColor = UIColor(red: 0.82, green: 0.84, blue: 0.86, alpha: 1)
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Шытырман оқиғалы мультсериал Елбасының «Ұлы даланың жеті қыры» бағдарламасы аясында жүзеге асырылған. Мақалада қызғалдақтардың отаны Қазақстан екені айтылады."
        descriptionLabel.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        descriptionLabel.textColor = UIColor(red: 0.61, green: 0.64, blue: 0.69, alpha: 1.00)
        descriptionLabel.numberOfLines = 4
        
        let fullDescriptionButton = UIButton()
        fullDescriptionButton.setTitle("Толығырақ", for: .normal)
        fullDescriptionButton.setTitleColor(UIColor(red: 0.7, green: 0.46, blue: 0.97, alpha: 1), for: .normal)
        fullDescriptionButton.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 14)
        
        let directorLabel = UILabel()
        directorLabel.text = "Режиссер:"
        directorLabel.textColor = UIColor(red: 0.294, green: 0.333, blue: 0.388, alpha: 1)
        directorLabel.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        
        let producerLabel = UILabel()
        producerLabel.text = "Продюсер:"
        producerLabel.textColor = UIColor(red: 0.294, green: 0.333, blue: 0.388, alpha: 1)
        producerLabel.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        
        let directorNameLabel = UILabel()
        directorNameLabel.text = "Бақдәулет Әлімбеков"
        directorNameLabel.textColor = UIColor(red: 0.294, green: 0.333, blue: 0.388, alpha: 1)
        directorNameLabel.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        
        let producerNameLabel = UILabel()
        producerNameLabel.text = "Сандуғаш Кенжебаева"
        producerNameLabel.textColor = UIColor(red: 0.294, green: 0.333, blue: 0.388, alpha: 1)
        producerNameLabel.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        
        let grayView2 = UIView()
        grayView2.backgroundColor = UIColor(red: 0.82, green: 0.84, blue: 0.86, alpha: 1)
        
        let seasonsLabel = UILabel()
        seasonsLabel.text = "Бөлімдер"
        seasonsLabel.textColor = UIColor(red: 0.067, green: 0.094, blue: 0.153, alpha: 1)
        seasonsLabel.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        
        let seasonsButton = UIButton()
        seasonsButton.setTitle("5 сезон, 46 серия", for: .normal)
        seasonsButton.setTitleColor(UIColor(red: 0.612, green: 0.639, blue: 0.686, alpha: 1), for: .normal)
        seasonsButton.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 12)
        
        let arrowImage = UIImageView()
        arrowImage.image = UIImage(named: "arrowImage")
        
        let screenshotsLabel = UILabel()
        screenshotsLabel.text = "Скриншоттар"
        screenshotsLabel.textColor = UIColor(red: 0.067, green: 0.094, blue: 0.153, alpha: 1)
        screenshotsLabel.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        
        lazy var screenshotsCollectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 0.0, left: 24.0, bottom: 0.0, right: 24.0)
            layout.itemSize = CGSize(width: 184, height: 112)
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 16
            layout.minimumInteritemSpacing = 16
            
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.register(ScreenshotCollectionViewCell.self, forCellWithReuseIdentifier: "ScreenshotCell")

            collectionView.showsHorizontalScrollIndicator = false
            collectionView.backgroundColor = .systemBackground
            
            return collectionView
        }()
        
        let similarMoviesLabel = UILabel()
        similarMoviesLabel.text = "Ұқсас телехикаялар"
        similarMoviesLabel.textColor = UIColor(red: 0.067, green: 0.094, blue: 0.153, alpha: 1)
        similarMoviesLabel.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        
        let similarCollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 0.0, left: 24.0, bottom: 0.0, right: 24.0)
            layout.itemSize = CGSize(width: 112, height: 208)
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 12
            layout.minimumInteritemSpacing = 12
            
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.register(SimilarCollectionViewCell.self, forCellWithReuseIdentifier: "SimilarCell")
            collectionView.showsHorizontalScrollIndicator = false
            
            collectionView.backgroundColor = .systemBackground
            
            return collectionView
        }()
        
        view.addSubview(nameLabel)
        view.addSubview(detailLabel)
        view.addSubview(grayView1)
        view.addSubview(descriptionLabel)
        view.addSubview(fullDescriptionButton)
        view.addSubview(directorLabel)
        view.addSubview(producerLabel)
        view.addSubview(directorNameLabel)
        view.addSubview(producerNameLabel)
        view.addSubview(grayView2)
        view.addSubview(seasonsLabel)
        view.addSubview(seasonsButton)
        view.addSubview(screenshotsCollectionView)
        view.addSubview(arrowImage)
        view.addSubview(screenshotsLabel)
        
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.left.equalToSuperview().offset(24)
        }
        
        detailLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
        }
        
        grayView1.snp.makeConstraints { make in
            make.top.equalTo(detailLabel.snp.bottom).offset(24)
            make.right.left.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(grayView1.snp.bottom).offset(24)
            make.right.left.equalToSuperview().inset(24)
        }
        
        fullDescriptionButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().inset(24)
        }
        
        directorLabel.snp.makeConstraints { make in
            make.top.equalTo(fullDescriptionButton.snp.bottom).offset(24)
            make.left.equalToSuperview().inset(24)
            make.height.equalTo(17)
        }
        
        directorNameLabel.snp.makeConstraints { make in
            make.top.equalTo(fullDescriptionButton.snp.bottom).offset(24)
            make.left.equalToSuperview().inset(113)
            make.right.equalToSuperview().inset(24)
        }
        
        producerLabel.snp.makeConstraints { make in
            make.top.equalTo(directorLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().inset(24)
        }
        
        producerNameLabel.snp.makeConstraints { make in
            make.top.equalTo(directorNameLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().inset(113)
            make.right.equalToSuperview().inset(24)
        }
        
        grayView2.snp.makeConstraints { make in
            make.top.equalTo(producerNameLabel.snp.bottom).offset(24)
            make.right.left.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
        
        seasonsLabel.snp.makeConstraints { make in
            make.top.equalTo(grayView2.snp.bottom).offset(24)
            make.left.equalToSuperview().inset(24)
        }
        
        seasonsButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(48)
            make.left.equalTo(seasonsLabel.snp.right)
            make.centerY.equalTo(seasonsLabel)
        }
        
        arrowImage.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 16, height: 16))
            make.right.equalToSuperview().inset(24)
            make.centerY.equalTo(seasonsLabel)
        }
        
        screenshotsLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24)
            make.top.equalTo(seasonsLabel.snp.bottom).offset(150)
        }
        
        screenshotsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(screenshotsLabel.snp.bottom).inset(16)
            make.right.left.equalToSuperview()
        }
       
        return view
    }()
            
            //MARK: - Add Subviews
            view.addSubview(posterImageView)
            view.addSubview(arrowButton)
            view.addSubview(favoriteButton)
            view.addSubview(shareButton)
            view.addSubview(playButton)
            view.addSubview(favoriteButtonLabel)
            view.addSubview(shareButtonLabel)
            view.addSubview(backgroundView)
            
            //MARK: - Constraints
            
            posterImageView.snp.makeConstraints { make in
                make.top.right.left.equalToSuperview()
                make.height.equalTo(330)
                make.width.equalTo(393)
            }
            
            arrowButton.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(54)
                make.left.equalToSuperview()
                make.size.equalTo(CGSize(width: 95, height: 100))
            }
            
            favoriteButton.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(228)
                make.size.equalTo(CGSize(width: 100, height: 100))
                make.left.equalToSuperview().inset(37)
            }
            
            shareButton.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(228)
                make.size.equalTo(CGSize(width: 100, height: 100))
                make.right.equalToSuperview().inset(37)
            }
            
            playButton.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(198)
                make.size.equalTo(CGSize(width: 132, height: 132))
                make.centerX.equalToSuperview()
            }
            
            favoriteButtonLabel.snp.makeConstraints { make in
                make.top.equalTo(favoriteButton.snp.top).inset(46)
                make.centerX.equalTo(favoriteButton)
            }
            
            shareButtonLabel.snp.makeConstraints { make in
                make.top.equalTo(shareButton.snp.top).inset(46)
                make.centerX.equalTo(shareButton)
            }
            
            backgroundView.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(324)
                make.bottom.right.left.equalToSuperview()
                make.height.equalTo(1150)
            }
           
        return view
    }()
         
        scrollView.addSubview(movieContentView)
        
        movieContentView.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
       
        return scrollView
    }()
    
    
}

extension MovieInfoController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScreenshotCell", for: indexPath) as! ScreenshotCollectionViewCell
        
        return cell
    }

}
