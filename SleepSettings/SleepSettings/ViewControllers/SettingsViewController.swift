//
//  FirstViewController.swift
//  SleepSettings
//
//  Created by Justin Bengtson on 9/12/20.
//  Copyright © 2020 Justin Bengtson. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var settings = [Settings]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "SettingsCell", bundle: nil), forCellReuseIdentifier: "SettingsCell")
        tableView.register(UINib(nibName: "CustomTableViewHeaderCell", bundle: nil), forCellReuseIdentifier: "headerCell")
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        createSettingObjects()
    }


    func createSettingObjects() {
        let wakeupTime = Settings(title: "Wakeup Time", titleDetails: "What time should you wake up?", settingStatus: "7:30 AM") {
            print("Let's wake up!")
        }
        
        let sleepAlarmSettings = Settings(title: "Sleep Alarm Settings", titleDetails: nil, settingStatus: "On") {
            print("Toggle Setting")
        }
        
        let dreamScape = Settings(title: "Dreamscape", titleDetails: "What music would you like to hear", settingStatus: "Random") {
            print("Toggle Dreamscape settings")
        }
        
        let narration = Settings(title: "Narration", titleDetails: "What narraion would you like to hear?", settingStatus: "Classic Pzizz Sleep") {
            print("Change narration setings")
        }
        
        let voice = Settings(title: "Voice", titleDetails: "Which voice would you like to hear?", settingStatus: "Bethany") {
            print("Change voice settings")
        }
        
        let music = Settings(title: "Music fade out", titleDetails: "Amount of time before music fades out", settingStatus: "1hr 20min") {
            print("Fade out setings")
        }
        
        settings.append(wakeupTime)
        settings.append(sleepAlarmSettings)
        settings.append(dreamScape)
        settings.append(narration)
        settings.append(voice)
        settings.append(music)
    }
}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingsCell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsTableViewCell
        
        settingsCell.settingsLabel.text = settings[indexPath.row].title
        settingsCell.detailSettingsLabel.text = settings[indexPath.row].titleDetails
        settingsCell.statusLabel.text = settings[indexPath.row].settingStatus
        settingsCell.accessoryType = .disclosureIndicator
        
        return settingsCell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! CustotmHeaderTableViewCell
        headerCell.sectionHeaderLabel.text = "Something Is Here"
        return headerCell
    }
    
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        
        let selectedSetting = settings[index].action
        
        selectedSetting()
    }
}
