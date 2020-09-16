//
//  Settings.swift
//  SleepSettings
//
//  Created by Justin Bengtson on 9/12/20.
//  Copyright © 2020 Justin Bengtson. All rights reserved.
//

import Foundation

struct Settings {
    var title: String
    var titleDetails: String?
    var settingStatus: String
    var sectionTitle: String?
    var action: () -> Void
}
