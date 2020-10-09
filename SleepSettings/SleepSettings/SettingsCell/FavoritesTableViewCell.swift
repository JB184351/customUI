//
//  TableViewCell.swift
//  SleepSettings
//
//  Created by Justin Bengtson on 9/30/20.
//  Copyright © 2020 Justin Bengtson. All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {
    @IBOutlet var collectionView: UICollectionView!
    var favorites = [Favorites]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "FavoritesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionViewCell")
    }
    
    func setup(with model: [Favorites]) {
        self.favorites = model
        self.collectionView.reloadData()
    }
    
}

extension FavoritesTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let favorite = favorites[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! FavoritesCollectionViewCell
        cell.setup(with: favorite)
        return cell
    }


}

extension FavoritesTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let favorite = favorites[indexPath.row]

        let selectedFavorite = favorite.action

        selectedFavorite()
    }
}

extension FavoritesTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let favorite = favorites[indexPath.row].title!
        let size = favorite.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17.0, weight: .regular)])
        return CGSize(width: size.width, height: 50.0)
    }
}