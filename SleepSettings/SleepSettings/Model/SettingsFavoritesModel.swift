//
//  SettingsFavoritesModel.swift
//  SleepSettings
//
//  Created by Justin Bengtson on 10/10/20.
//  Copyright © 2020 Justin Bengtson. All rights reserved.
//

import Foundation

struct SettingsFavoritesModel: SettingsProtocol {
  var title: String?
  var action: () -> Void
}
