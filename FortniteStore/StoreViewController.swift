//
//  ViewController.swift
//  FortniteStore
//
//  Created by Jules Labador on 3/20/19.
//  Copyright © 2019 Jules Labador. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class StoreViewController: UIViewController {
    
    var headers: HTTPHeaders = ["TRN-Api-Key": "6aab0ad1-6a86-4756-86cb-b37852ae3899"]
    var storeItems: [StoreItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        Alamofire.request("https://api.fortnitetracker.com/v1/store", method: .get, headers: headers).responseJSON { (response) in
            
            guard let result = response.result.value else { return }
            let jsonData = JSON(result)
            print(jsonData)
            
            for i in jsonData {
                self.storeItems.append(StoreItem(name: i.1["name"].stringValue,
                                                 vBucks: i.1["vBucks"].intValue,
                                                 manifestID: i.1["manifestID"].intValue,
                                                 rarity: i.1["rarity"].stringValue,
                                                 storeCategory: i.1["storeCategory"].stringValue,
                                                 imageURL: i.1["imageUrl"].stringValue))
                
            }
            
            self.collectionView.storeItems = self.storeItems
            self.collectionView.reloadData()
            
            self.setupViews()
            
        }
        
    }
    let storeLabel: UILabel = {
       
        let label = UILabel()
        label.text = "Fortnite Store"
        label.font = UIFont(name: "Avenir-Black", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    let collectionView = StoreCollectionView()
    func setupViews() {
        
        view.backgroundColor = UIColor.rgb(red: 249, green: 250, blue: 251)
        
        view.addSubview(storeLabel)
        storeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        storeLabel.leftAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.leftAnchor, constant: 24).isActive = true
        
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: storeLabel.bottomAnchor, constant: 24).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24).isActive = true
        
    }
}

extension UIColor {
    class func rgb(red: Int, green: Int, blue: Int) -> UIColor {
        return UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1)
    }
}
