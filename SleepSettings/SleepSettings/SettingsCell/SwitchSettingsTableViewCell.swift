//
//  SwitchSetingsCell.swift
//  SleepSettings
//
//  Created by Justin Bengtson on 9/16/20.
//  Copyright © 2020 Justin Bengtson. All rights reserved.
//

import UIKit

class SwitchSettingsTableViewCell: UITableViewCell {
  
  @IBOutlet private var settingsLabel: UILabel!
  @IBOutlet private var detailSettingsLabel: UILabel!
  @IBOutlet private var settingsSwitch: UISwitch!
    
  //==================================================
  // MARK: - Setup
  //==================================================
  
  public func setup(with model: SettingsModel) {
    settingsLabel.text = model.setting
    detailSettingsLabel.text = model.settingDetails
  }
  
}
