//
//  BannerMovie.swift
//  Ozinshe App Snapkit
//
//  Created by Мерей Булатова on 08.11.2023.
//

import Foundation
import SwiftyJSON

class BannerMovie {
    var id = 0
    var link = ""
    var movie: Movie = Movie()
    
    init() {
        
    }
    
    init(json: JSON) {
        if let temp = json["id"].int {
            self.id = temp
        }
        if let temp = json["link"].string {
            self.link = temp
        }
        if json["movie"].exists() {
            movie = Movie(json: json["movie"])
        }
    }
}
