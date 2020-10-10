//
//  Settings.swift
//  SleepSettings
//
//  Created by Justin Bengtson on 9/12/20.
//  Copyright © 2020 Justin Bengtson. All rights reserved.
//

import Foundation


// Virgil: You can move this protocol in a separate file
protocol SettingsProtocol {
    
}


// Virgil: You can move these two models in separate files
// A more correct name would be SettingsModel
struct SleepModel: SettingsProtocol {
    var setting: String
    var settingDetails: String?
    var settingStatus: String?
    var cellType: SettingCellType
    var action: () -> Void
}

// A more correct name would be SettingsFavoritesModel
struct FavoritesModel: SettingsProtocol {
    var title: String?
    var action: () -> Void
}
