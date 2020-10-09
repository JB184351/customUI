//
//  SettingsCell.swift
//  SleepSettings
//
//  Created by Justin Bengtson on 9/12/20.
//  Copyright © 2020 Justin Bengtson. All rights reserved.
//

import UIKit

class SleepSettingsCell: UITableViewCell {

    @IBOutlet var settingsLabel: UILabel!
    @IBOutlet var detailSettingsLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    
    func setup(with model: SleepModel) {
        
        settingsLabel.text = model.setting
        detailSettingsLabel.text = model.settingDetails
        statusLabel.text = model.settingStatus! + " >"
    }
    
}
