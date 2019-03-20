//
//  StoreItem.swift
//  FortniteStore
//
//  Created by Jules Labador on 3/20/19.
//  Copyright © 2019 Jules Labador. All rights reserved.
//

enum StoreCategory: String, Codable {
    
    case Weekly = "BRWeeklyStorefront"
    case Daily = "BRDailyStorefront"
    
}

enum ItemRarity: String, Codable {

    case Sturdy = "Sturdy"
    case Quality = "Quality"
    case Handmade = "Handmade"
    case Unknown = "Unknown"
    
}

import UIKit
import Alamofire
import AlamofireImage

class StoreItem {
    
    var name: String
    var vBucks: Int
    var manifestID: Int
    var rarity: ItemRarity
    var storeCategory: StoreCategory?
    
    var image: UIImage?
    
    init(name: String, vBucks: Int, manifestID: Int, rarity: String, storeCategory: String, imageURL: String) {
        
        self.name = name
        self.vBucks = vBucks
        self.manifestID = manifestID
        
        if rarity == "Sturdy" {
            self.rarity = .Sturdy
        } else if rarity == "Handmade" {
            self.rarity = .Handmade
        } else if rarity == "Quality" {
            self.rarity = .Quality
        } else {
            self.rarity = .Unknown
        }
        
        if storeCategory == "BRWeeklyStorefront" {
            self.storeCategory = .Weekly
        } else if storeCategory == "BRDailyStorefront" {
            self.storeCategory = .Daily
        }
        
        Alamofire.request(imageURL).responseImage { (response) in
            if let image = response.result.value {
                self.image = image
            }
        }
        
        
        
    }
}
