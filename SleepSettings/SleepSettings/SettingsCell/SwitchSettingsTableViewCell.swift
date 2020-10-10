//
//  SwitchSetingsCell.swift
//  SleepSettings
//
//  Created by Justin Bengtson on 9/16/20.
//  Copyright © 2020 Justin Bengtson. All rights reserved.
//

import UIKit

class SwitchSettingsTableViewCell: UITableViewCell {
    
    @IBOutlet var settingsLabel: UILabel!
    @IBOutlet var detailSettingsLabel: UILabel!
    @IBOutlet var settingsSwitch: UISwitch!
    
    func setup(with model: SettingsModel) {
        settingsLabel.text = model.setting
        detailSettingsLabel.text = model.settingDetails
    }
    
}
