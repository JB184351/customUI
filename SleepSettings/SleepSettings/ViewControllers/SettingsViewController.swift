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
        tableView.register(UINib(nibName: "CustomHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "headerCell")
        tableView.register(UINib(nibName: "SwitchSettingsCell", bundle: nil), forCellReuseIdentifier: "switchCell")
        createSettingObjects()
    }
    
    
    func createSettingObjects() {
        let wakeupTime = Settings(title: "Wakeup Time", titleDetails: "What time should you wake up?", settingStatus: "7:30 AM", cellType: .label) {
            print("Let's wake up!")
        }
        
        let sleepAlarmSettings = Settings(title: "Sleep Alarm Settings", titleDetails: nil, settingStatus: "On", cellType: .label) {
            print("Toggle Setting")
        }
        
        let dreamScape = Settings(title: "Dreamscape", titleDetails: "What music would you like to hear", settingStatus: "Random", cellType: .label) {
            print("Toggle Dreamscape settings")
        }
        
        let narration = Settings(title: "Narration", titleDetails: "What narraion would you like to hear?", settingStatus: "Classic Pzizz Sleep", cellType: .label) {
            print("Change narration setings")
        }
        
        let voice = Settings(title: "Voice", titleDetails: "Which voice would you like to hear?", settingStatus: "Bethany", cellType: .label) {
            print("Change voice settings")
        }
        
        let loop = Settings(title: "Loop Narration", titleDetails: "Toggle if the narration should loop until  your voice fade out time", settingStatus: nil, cellType: .button) {
            print("Loop Narration Action")
        }
        
        let music = Settings(title: "Music fade out", titleDetails: "Amount of time before music stops playing", settingStatus: "1hr 20min", cellType: .label) {
            print("Fade out setings")
        }
        
        let voiceFade = Settings(title: "Voice Fade", titleDetails: "Amount of time before voice stops playing", settingStatus: "1hr 20min", cellType: .label) {
            print("Voice fade out settings")
        }
        
        let musicWakeup = Settings(title: "Music wakeup section", titleDetails: "sequence that plays at the end of a session and gently brings you back from sleep \n Note: the wakeup section won't play for seesion less than ten minutes", settingStatus: nil, cellType: .button) {
            print("Music Wakeup Section")
        }
        
        let threeDeeVoice = Settings(title: "3D voice", titleDetails: "Enjoy an immersive surrround sound effect with the voice. Best with headphones", settingStatus: nil, cellType: .button) {
            print("3D Voice")
        }
        
        let threeDeeVoiceSpeed = Settings(title: "3D voice speed", titleDetails: "Amount of time it takes for hte 3D voice effect to simulate a full revolution around your head", settingStatus: "18s", cellType: .label) {
            print("3D Voice Speed")
        }
        
        let delayStart = Settings(title: "Delay start", titleDetails: "Amount of time before session starts playing", settingStatus: "Off", cellType: .label) {
            print("Delay start")
        }
        
        let ratings = Settings(title: "Ratings", titleDetails: "Rate your session after completion", settingStatus: nil, cellType: .button) {
            print("Give a rating")
        }
        
        let audioFusion = Settings(title: "Audio Fusion", titleDetails: "Allow Pzizz to play in the background while other audio plays", settingStatus: nil, cellType: .button) {
            print("Audio Fusion")
        }
            
        settings.append(wakeupTime)
        settings.append(sleepAlarmSettings)
        settings.append(dreamScape)
        settings.append(narration)
        settings.append(voice)
        settings.append(loop)
        settings.append(music)
        settings.append(voiceFade)
        settings.append(musicWakeup)
        settings.append(threeDeeVoice)
        settings.append(threeDeeVoiceSpeed)
        settings.append(delayStart)
        settings.append(ratings)
        settings.append(audioFusion)
    }
}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingsCell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsTableViewCell
        let buttonTypeCell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SwitchSettingsCell
        
        let setting = settings[indexPath.row]
        
        switch setting.cellType {
        case .button:
            buttonTypeCell.setup(with: setting)
            return buttonTypeCell
        case .label:
            settingsCell.setup(with: setting)
            return settingsCell
        }
    }
    
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        
        let selectedSetting = settings[index].action
        
        selectedSetting()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch section {
        case 0:
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! CustomHeaderTableViewCell
            headerCell.sectionHeaderLabel.text = "Something Is Here"
            return headerCell
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
