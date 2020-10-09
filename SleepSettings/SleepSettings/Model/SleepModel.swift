//
//  Settings.swift
//  SleepSettings
//
//  Created by Justin Bengtson on 9/12/20.
//  Copyright © 2020 Justin Bengtson. All rights reserved.
//

import Foundation

protocol SettingsProtocol {
    
}

struct SleepModel: SettingsProtocol {
    var setting: String
    var settingDetails: String?
    var settingStatus: String?
    var cellType: SettingCellType
    var action: () -> Void
}

struct FavoritesModel: SettingsProtocol {
    var title: String?
    var action: () -> Void
}
