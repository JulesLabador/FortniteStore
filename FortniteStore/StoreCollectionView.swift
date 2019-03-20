//
//  StoreCollectionView.swift
//  FortniteStore
//
//  Created by Jules Labador on 3/20/19.
//  Copyright © 2019 Jules Labador. All rights reserved.
//

import UIKit

class StoreCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cellID"
    var storeItems: [StoreItem] = []
    
    init() {
        
        // In case customization needs to be implemented for the layout
        let layout = UICollectionViewFlowLayout()
        
        super.init(frame: CGRect.zero, collectionViewLayout: layout)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.clear
        
        delegate = self
        dataSource = self
        register(StoreCell.self, forCellWithReuseIdentifier: cellID)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storeItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? StoreCell else { fatalError("Could not dequeue cell") }
        
        cell.nameLabel.text = storeItems[indexPath.row].name
        cell.itemImage.image = storeItems[indexPath.row].image
        cell.costLabel.text = "\(storeItems[indexPath.row].vBucks) vBucks"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 160)
    }
    
}

class StoreCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let itemImage: UIImageView = {
        
        let view = UIImageView()
        view.layer.cornerRadius = 5
        view.contentMode = .scaleAspectFill
        view.backgroundColor = UIColor.clear
//        view.backgroundColor = UIColor.rgb(red: 249, green: 250, blue: 251)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    let nameLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    let costLabel: UILabel = {
       
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    func setupViews() {
        
        addSubview(itemImage)
        itemImage.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 24).isActive = true
        itemImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        itemImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        itemImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(nameLabel)
        nameLabel.leftAnchor.constraint(equalTo: itemImage.rightAnchor, constant: 24).isActive = true
        nameLabel.topAnchor.constraint(equalTo: itemImage.topAnchor).isActive = true
        
        addSubview(costLabel)
        costLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4).isActive = true
        costLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        
    }
}
