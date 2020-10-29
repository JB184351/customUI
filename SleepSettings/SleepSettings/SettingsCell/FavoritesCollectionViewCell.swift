//
//  SettingsCollectionViewCell.swift
//  SleepSettings
//
//  Created by Justin Bengtson on 9/30/20.
//  Copyright © 2020 Justin Bengtson. All rights reserved.
//

import UIKit

class FavoritesCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet private var favoritesLabel: UILabel!
  
  public func setup(with model: SettingsFavoritesModel) {
    favoritesLabel.text = model.title
  }
}
