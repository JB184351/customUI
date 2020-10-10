//
//  SwitchSetingsCell.swift
//  SleepSettings
//
//  Created by Justin Bengtson on 9/16/20.
//  Copyright © 2020 Justin Bengtson. All rights reserved.
//

import UIKit

// Virgil: Why this cell is called only Cell when you have FavoritesTableViewCell?
// Be consistent in the naming scheme you adapt
// Either it's <name>Cell or <name>TableViewCell
class SwitchSettingsCell: UITableViewCell {
    
    @IBOutlet var settingsLabel: UILabel!
    @IBOutlet var detailSettingsLabel: UILabel!
    @IBOutlet var settingsSwitch: UISwitch!
    
    func setup(with model: SleepModel) {
        settingsLabel.text = model.setting
        detailSettingsLabel.text = model.settingDetails
    }
    
}
