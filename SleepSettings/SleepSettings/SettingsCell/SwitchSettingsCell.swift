//
//  SwitchSetingsCell.swift
//  SleepSettings
//
//  Created by Justin Bengtson on 9/16/20.
//  Copyright © 2020 Justin Bengtson. All rights reserved.
//

import UIKit

class SwitchSettingsCell: UITableViewCell {
    
    @IBOutlet var settingsLabel: UILabel!
    @IBOutlet var detailSettingsLabel: UILabel!
    @IBOutlet var settingsswitch: UISwitch!
    
    func setup(with model: Settings) {
        settingsLabel.text = model.setting
        detailSettingsLabel.text = model.settingDetails
    }
    
}
