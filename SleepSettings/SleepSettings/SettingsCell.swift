//
//  SettingsCell.swift
//  SleepSettings
//
//  Created by Justin Bengtson on 9/12/20.
//  Copyright © 2020 Justin Bengtson. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {

    @IBOutlet var settingsLabel: UILabel!
    @IBOutlet var detailSettingsLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0))
    }
    
    func setup(with model: Settings) {
        
        settingsLabel.text = model.setting
        detailSettingsLabel.text = model.settingDetails
        statusLabel.text = model.settingStatus! + " >"
    }
    
}
