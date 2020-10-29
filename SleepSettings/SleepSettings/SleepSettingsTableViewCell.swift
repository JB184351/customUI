//
//  SettingsCell.swift
//  SleepSettings
//
//  Created by Justin Bengtson on 9/12/20.
//  Copyright © 2020 Justin Bengtson. All rights reserved.
//

import UIKit

class SleepSettingsTableViewCell: UITableViewCell {
  
  @IBOutlet private var settingsLabel: UILabel!
  @IBOutlet private var detailSettingsLabel: UILabel!
  @IBOutlet private var statusLabel: UILabel!
  
  public func setup(with model: SettingsModel) {
    settingsLabel.text = model.setting
    detailSettingsLabel.text = model.settingDetails
    statusLabel.text = model.settingStatus! + " >"
  }
  
}
