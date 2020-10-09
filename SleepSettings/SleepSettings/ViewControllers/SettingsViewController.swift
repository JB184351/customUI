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
    var settings = [[SettingsProtocol]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "SleepSettingsCell", bundle: nil), forCellReuseIdentifier: "SettingsCell")
        tableView.register(UINib(nibName: "SectionHeaderCell", bundle: nil), forCellReuseIdentifier: "headerCell")
        tableView.register(UINib(nibName: "SwitchSettingsCell", bundle: nil), forCellReuseIdentifier: "switchCell")
        tableView.register(UINib(nibName: "FavoritesCell", bundle: nil), forCellReuseIdentifier: "favoritesCell")
        createSettingObjects()
    }
    
    
    func createSettingObjects() {
        
        let newFavorite = FavoritesModel(title: "+ New Favorite") {
            let addedFavorite = FavoritesModel(title: "Newer Favorite") {
                print("added")
            }
            
            self.settings[0].append(addedFavorite)
            self.tableView.reloadData()
        }
        
        let wakeupTime = SleepModel(setting: "Wakeup Time", settingDetails: "What time should you wake up?", settingStatus: "7:30 AM", cellType: .label) {
            print("Let's wake up!")
        }
        
        let sleepAlarmSettings = SleepModel(setting: "Sleep Alarm Settings", settingDetails: nil, settingStatus: "On", cellType: .label) {
            print("Toggle Setting")
        }
        
        let dreamScape = SleepModel(setting: "Dreamscape", settingDetails: "What music would you like to hear", settingStatus: "Random", cellType: .label) {
            print("Toggle Dreamscape settings")
        }
        
        let narration = SleepModel(setting: "Narration", settingDetails: "What narraion would you like to hear?", settingStatus: "Classic Pzizz Sleep", cellType: .label) {
            print("Change narration setings")
        }
        
        let voice = SleepModel(setting: "Voice", settingDetails: "Which voice would you like to hear?", settingStatus: "Bethany", cellType: .label) {
            print("Change voice settings")
        }
        
        let loop = SleepModel(setting: "Loop Narration", settingDetails: "Toggle if the narration should loop until  your voice fade out time", settingStatus: nil, cellType: .button) {
            print("Loop Narration Action")
        }
        
        let music = SleepModel(setting: "Music fade out", settingDetails: "Amount of time before music stops playing", settingStatus: "1hr 20min", cellType: .label) {
            print("Fade out setings")
        }
        
        let voiceFade = SleepModel(setting: "Voice Fade", settingDetails: "Amount of time before voice stops playing", settingStatus: "1hr 20min", cellType: .label) {
            print("Voice fade out settings")
        }
        
        let musicWakeup = SleepModel(setting: "Music wakeup section", settingDetails: "sequence that plays at the end of a session and gently brings you back from sleep \n Note: the wakeup section won't play for seesion less than ten minutes", settingStatus: nil, cellType: .button) {
            print("Music Wakeup Section")
        }
        
        let threeDeeVoice = SleepModel(setting: "3D voice", settingDetails: "Enjoy an immersive surrround sound effect with the voice. Best with headphones", settingStatus: nil, cellType: .button) {
            print("3D Voice")
        }
        
        let threeDeeVoiceSpeed = SleepModel(setting: "3D voice speed", settingDetails: "Amount of time it takes for hte 3D voice effect to simulate a full revolution around your head", settingStatus: "18s", cellType: .label) {
            print("3D Voice Speed")
        }
        
        let delayStart = SleepModel(setting: "Delay start", settingDetails: "Amount of time before session starts playing", settingStatus: "Off", cellType: .label) {
            print("Delay start")
        }
        
        let ratings = SleepModel(setting: "Ratings", settingDetails: "Rate your session after completion", settingStatus: nil, cellType: .button) {
            print("Give a rating")
        }
        
        let audioFusion = SleepModel(setting: "Audio Fusion", settingDetails: "Allow Pzizz to play in the background while other audio plays", settingStatus: nil, cellType: .button) {
            print("Audio Fusion")
        }
        
        
        let zeroSection = [newFavorite]
        settings.append(zeroSection)
        
        let firstSection = [wakeupTime, sleepAlarmSettings]
        settings.append(firstSection)
        
        let secondSection = [dreamScape, narration, voice, loop, music, voiceFade, musicWakeup, threeDeeVoice, threeDeeVoiceSpeed, delayStart]
        settings.append(secondSection)
        
        let thirdSection = [ratings, audioFusion]
        settings.append(thirdSection)
    }
}

extension SettingsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        
        return settings[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setting = settings[indexPath.section][indexPath.row] as? SleepModel
        
        if indexPath.section == 0 {
            let collectionViewCell = tableView.dequeueReusableCell(withIdentifier: "favoritesCell") as! FavoritesTableViewCell
            collectionViewCell.setup(with: settings[indexPath.section] as! [FavoritesModel])
            return collectionViewCell
        }
        
        switch setting!.cellType {
        case .button:
            let buttonTypeCell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SwitchSettingsCell
            buttonTypeCell.setup(with: setting!)
            return buttonTypeCell
        case .label:
            let settingsCell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SleepSettingsCell
            settingsCell.setup(with: setting!)
            return settingsCell
        }
    }
    
}

extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let setting = settings[indexPath.section][indexPath.row] as! SleepModel
        let selectedSetting = setting.action
        selectedSetting()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch section {
        case 1:
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! SectionHeaderCell
            headerCell.sectionHeaderLabel.text = "Alarm Settings"
            return headerCell
        case 2:
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! SectionHeaderCell
            headerCell.sectionHeaderLabel.text = "Sleep Settings"
            return headerCell
        case 3:
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! SectionHeaderCell
            headerCell.sectionHeaderLabel.text = "General Settings"
            return headerCell
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0.0
        default:
            return 50.0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
