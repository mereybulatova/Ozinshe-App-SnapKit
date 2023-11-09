//
//  Genre.swift
//  Ozinshe App Snapkit
//
//  Created by Мерей Булатова on 08.11.2023.
//

import Foundation
import SwiftyJSON

class Genre {
    public var id: Int = 0
    public var name: String = ""
    public var link: String = ""
    
    init(json: JSON) {
        if let temp = json["id"].int {
            self.id = temp
        }
        if let temp = json["name"].string {
            self.name = temp
        }
        if let temp = json["link"].string {
            self.link = temp
        }
    }
}

