//
//  SettingsCell.swift
//  SleepSettings
//
//  Created by Justin Bengtson on 9/12/20.
//  Copyright © 2020 Justin Bengtson. All rights reserved.
//

import UIKit

// Virgil: Why this cell is called only Cell when you have FavoritesTableViewCell?
// Be consistent in the naming scheme you adapt
// Either it's <name>Cell or <name>TableViewCell
class SleepSettingsCell: UITableViewCell {

    @IBOutlet var settingsLabel: UILabel!
    @IBOutlet var detailSettingsLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    
    func setup(with model: SleepModel) {
        // Virgil: Remove extra line
        settingsLabel.text = model.setting
        detailSettingsLabel.text = model.settingDetails
        statusLabel.text = model.settingStatus! + " >"
    }
    
}
