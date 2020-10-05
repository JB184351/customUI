//
//  SettingsCollectionViewCell.swift
//  SleepSettings
//
//  Created by Justin Bengtson on 9/30/20.
//  Copyright © 2020 Justin Bengtson. All rights reserved.
//

import UIKit

class SettingsCollectionViewCell: UICollectionViewCell {

    @IBOutlet var favoritesLabel: UILabel!
    
    
    func setup(with model: SettingsCollectionView) {
        favoritesLabel.text = model.title
    }

}
