//
//  MoviePlayerViewController.swift
//  Ozinshe App Snapkit
//
//  Created by Мерей Булатова on 06.11.2023.
//

import UIKit
import SnapKit
import YouTubePlayer

class MoviePlayerViewController: UIViewController {
    
    let player = {
        let view = YouTubePlayerView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(player)
        
        player.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        player.loadVideoID("")
    }
}
