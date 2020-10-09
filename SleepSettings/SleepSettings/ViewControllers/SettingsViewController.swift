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
        tableView.register(UINib(nibName: "SettingsCell", bundle: nil), forCellReuseIdentifier: "SettingsCell")
        tableView.register(UINib(nibName: "CustomHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "headerCell")
        tableView.register(UINib(nibName: "SwitchSettingsCell", bundle: nil), forCellReuseIdentifier: "switchCell")
        tableView.register(UINib(nibName: "SettingsCustomCell", bundle: nil), forCellReuseIdentifier: "favoritesCell")
        createSettingObjects()
    }
    
    
    func createSettingObjects() {
        
        let newFavorite = Favorites(title: "+ New Favorite", cellType: .collectionView) {
            let addedFavorite = Favorites(title: "Newer Favorite", cellType: .collectionView) {
                print("added")
            }
            
            self.settings[0].append(addedFavorite)
            self.tableView.reloadData()
        }
        
        let wakeupTime = Settings(setting: "Wakeup Time", settingDetails: "What time should you wake up?", settingStatus: "7:30 AM", cellType: .label) {
            print("Let's wake up!")
        }
        
        let sleepAlarmSettings = Settings(setting: "Sleep Alarm Settings", settingDetails: nil, settingStatus: "On", cellType: .label) {
            print("Toggle Setting")
        }
        
        let dreamScape = Settings(setting: "Dreamscape", settingDetails: "What music would you like to hear", settingStatus: "Random", cellType: .label) {
            print("Toggle Dreamscape settings")
        }
        
        let narration = Settings(setting: "Narration", settingDetails: "What narraion would you like to hear?", settingStatus: "Classic Pzizz Sleep", cellType: .label) {
            print("Change narration setings")
        }
        
        let voice = Settings(setting: "Voice", settingDetails: "Which voice would you like to hear?", settingStatus: "Bethany", cellType: .label) {
            print("Change voice settings")
        }
        
        let loop = Settings(setting: "Loop Narration", settingDetails: "Toggle if the narration should loop until  your voice fade out time", settingStatus: nil, cellType: .button) {
            print("Loop Narration Action")
        }
        
        let music = Settings(setting: "Music fade out", settingDetails: "Amount of time before music stops playing", settingStatus: "1hr 20min", cellType: .label) {
            print("Fade out setings")
        }
        
        let voiceFade = Settings(setting: "Voice Fade", settingDetails: "Amount of time before voice stops playing", settingStatus: "1hr 20min", cellType: .label) {
            print("Voice fade out settings")
        }
        
        let musicWakeup = Settings(setting: "Music wakeup section", settingDetails: "sequence that plays at the end of a session and gently brings you back from sleep \n Note: the wakeup section won't play for seesion less than ten minutes", settingStatus: nil, cellType: .button) {
            print("Music Wakeup Section")
        }
        
        let threeDeeVoice = Settings(setting: "3D voice", settingDetails: "Enjoy an immersive surrround sound effect with the voice. Best with headphones", settingStatus: nil, cellType: .button) {
            print("3D Voice")
        }
        
        let threeDeeVoiceSpeed = Settings(setting: "3D voice speed", settingDetails: "Amount of time it takes for hte 3D voice effect to simulate a full revolution around your head", settingStatus: "18s", cellType: .label) {
            print("3D Voice Speed")
        }
        
        let delayStart = Settings(setting: "Delay start", settingDetails: "Amount of time before session starts playing", settingStatus: "Off", cellType: .label) {
            print("Delay start")
        }
        
        let ratings = Settings(setting: "Ratings", settingDetails: "Rate your session after completion", settingStatus: nil, cellType: .button) {
            print("Give a rating")
        }
        
        let audioFusion = Settings(setting: "Audio Fusion", settingDetails: "Allow Pzizz to play in the background while other audio plays", settingStatus: nil, cellType: .button) {
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
        let setting = settings[indexPath.section][indexPath.row]
        
        switch setting.cellType {
        case .button:
            let buttonTypeCell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SwitchSettingsCell
            buttonTypeCell.setup(with: setting as! Settings)
            return buttonTypeCell
        case .label:
            let settingsCell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsCell
            settingsCell.setup(with: setting as! Settings)
            return settingsCell
        case .collectionView:
            let collectionViewCell = tableView.dequeueReusableCell(withIdentifier: "favoritesCell") as! FavoritesTableViewCell
            collectionViewCell.setup(with: settings[indexPath.section] as! [Favorites])
            return collectionViewCell
        }
    }
    
}

extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let setting = settings[indexPath.section][indexPath.row] as! Settings
        let selectedSetting = setting.action
        selectedSetting()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch section {
        case 1:
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! CustomHeaderTableViewCell
            headerCell.sectionHeaderLabel.text = "Alarm Settings"
            return headerCell
        case 2:
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! CustomHeaderTableViewCell
            headerCell.sectionHeaderLabel.text = "Sleep Settings"
            return headerCell
        case 3:
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! CustomHeaderTableViewCell
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
