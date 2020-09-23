//
//  SettingsCell.swift
//  SleepSettings
//
//  Created by Justin Bengtson on 9/12/20.
//  Copyright © 2020 Justin Bengtson. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet var settingsLabel: UILabel!
    @IBOutlet var detailSettingsLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    
    func setup(with model: Settings) {
        let settingText = model.title
        let settingDetailsText = model.titleDetails
        let statusLabelText = model.settingStatus
        
        settingsLabel.text = settingText
        detailSettingsLabel.text = settingDetailsText
        statusLabel.text = statusLabelText
        self.accessoryType = .disclosureIndicator
    }
}
