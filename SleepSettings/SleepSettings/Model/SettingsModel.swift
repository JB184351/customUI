//
//  Settings.swift
//  SleepSettings
//
//  Created by Justin Bengtson on 9/12/20.
//  Copyright © 2020 Justin Bengtson. All rights reserved.
//

import Foundation

enum SettingCellType {
  case button
  case label
}

struct SettingsModel: SettingsProtocol {
  var setting: String
  var settingDetails: String?
  var settingStatus: String?
  var cellType: SettingCellType
  var action: () -> Void
}
