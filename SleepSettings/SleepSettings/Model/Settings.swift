//
//  Settings.swift
//  SleepSettings
//
//  Created by Justin Bengtson on 9/12/20.
//  Copyright © 2020 Justin Bengtson. All rights reserved.
//

import Foundation

struct Settings {
    var setting: String
    var settingDetails: String?
    var settingStatus: String?
    var cellType: CellType
    var action: () -> Void
}
