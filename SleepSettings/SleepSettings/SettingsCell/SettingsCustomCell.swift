//
//  TableViewCell.swift
//  SleepSettings
//
//  Created by Justin Bengtson on 9/30/20.
//  Copyright © 2020 Justin Bengtson. All rights reserved.
//

import UIKit

class SettingsCustomCell: UITableViewCell {
    
    @IBOutlet var collectionView: UICollectionView!
    var favorites = [SettingsCollectionView]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "SettingsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionViewCell")
    }
    
    func createFavorite() {
        let addNewFavorite = SettingsCollectionView(title: "+ New Favorite", cellType: .collectionView) { () -> Void? in
            let newFavorite = SettingsCollectionView(title: "User Input",  cellType: .collectionView) { () -> Void? in
                print("User Input")
            }
            self.favorites.append(newFavorite)
            return ()
        }
        
        favorites.append(addNewFavorite)
    }
    
}

extension SettingsCustomCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let favorite = favorites[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! SettingsCollectionViewCell
        
        cell.favoritesLabel.text = favorite.title
        
        return cell
    }
    
    
}

extension SettingsCustomCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let favorite = favorites[indexPath.row]
        
        let selectedFavorite = favorite.action
        
        selectedFavorite()
    }
}

extension SettingsCustomCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let newFavorite = "+ New Favorite"
        let size = newFavorite.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17.0, weight: .regular)])
        return CGSize(width: size.width, height: 50.0)
    }
}
