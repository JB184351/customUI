//
//  FirstViewController.swift
//  SleepSettings
//
//  Created by Justin Bengtson on 9/12/20.
//  Copyright © 2020 Justin Bengtson. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
  
  @IBOutlet private var tableView: UITableView!
  private var settingsDataSource = [[SettingsProtocol]]()
  
  //==================================================
  // MARK: - LifeCycle Method
  //==================================================
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    
    tableView.register(UINib(nibName: "SleepSettingsTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingsCell")
    tableView.register(UINib(nibName: "SectionHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "headerCell")
    tableView.register(UINib(nibName: "SwitchSettingsTableViewCell", bundle: nil), forCellReuseIdentifier: "switchCell")
    tableView.register(UINib(nibName: "FavoritesTableViewCell", bundle: nil), forCellReuseIdentifier: "favoritesCell")
    
    createSettingObjects()
  }
  
  //==================================================
  // MARK: - Populating Data Source
  //==================================================
  
  private func createSettingObjects() {
    
    let newFavorite = SettingsFavoritesModel(title: "+ New Favorite") {
      let addedFavorite = SettingsFavoritesModel(title: "Newer Favorite") {
        print("added")
      }
      
      self.settingsDataSource[0].append(addedFavorite)
      self.tableView.reloadData()
    }
    
    let wakeupTime = SettingsModel(setting: "Wakeup Time", settingDetails: "What time should you wake up?", settingStatus: "7:30 AM", cellType: .label) {
      print("Let's wake up!")
    }
    
    let sleepAlarmSettings = SettingsModel(setting: "Sleep Alarm Settings", settingDetails: nil, settingStatus: "On", cellType: .label) {
      print("Toggle Setting")
    }
    
    let dreamScape = SettingsModel(setting: "Dreamscape", settingDetails: "What music would you like to hear", settingStatus: "Random", cellType: .label) {
      print("Toggle Dreamscape settings")
    }
    
    let narration = SettingsModel(setting: "Narration", settingDetails: "What narraion would you like to hear?", settingStatus: "Classic Pzizz Sleep", cellType: .label) {
      print("Change narration setings")
    }
    
    let voice = SettingsModel(setting: "Voice", settingDetails: "Which voice would you like to hear?", settingStatus: "Bethany", cellType: .label) {
      print("Change voice settings")
    }
    
    let loop = SettingsModel(setting: "Loop Narration", settingDetails: "Toggle if the narration should loop until  your voice fade out time", settingStatus: nil, cellType: .button) {
      print("Loop Narration Action")
    }
    
    let music = SettingsModel(setting: "Music fade out", settingDetails: "Amount of time before music stops playing", settingStatus: "1hr 20min", cellType: .label) {
      print("Fade out setings")
    }
    
    let voiceFade = SettingsModel(setting: "Voice Fade", settingDetails: "Amount of time before voice stops playing", settingStatus: "1hr 20min", cellType: .label) {
      print("Voice fade out settings")
    }
    
    let musicWakeup = SettingsModel(setting: "Music wakeup section", settingDetails: "sequence that plays at the end of a session and gently brings you back from sleep \n Note: the wakeup section won't play for seesion less than ten minutes", settingStatus: nil, cellType: .button) {
      print("Music Wakeup Section")
    }
    
    let threeDeeVoice = SettingsModel(setting: "3D voice", settingDetails: "Enjoy an immersive surrround sound effect with the voice. Best with headphones", settingStatus: nil, cellType: .button) {
      print("3D Voice")
    }
    
    let threeDeeVoiceSpeed = SettingsModel(setting: "3D voice speed", settingDetails: "Amount of time it takes for hte 3D voice effect to simulate a full revolution around your head", settingStatus: "18s", cellType: .label) {
      print("3D Voice Speed")
    }
    
    let delayStart = SettingsModel(setting: "Delay start", settingDetails: "Amount of time before session starts playing", settingStatus: "Off", cellType: .label) {
      print("Delay start")
    }
    
    let ratings = SettingsModel(setting: "Ratings", settingDetails: "Rate your session after completion", settingStatus: nil, cellType: .button) {
      print("Give a rating")
    }
    
    let audioFusion = SettingsModel(setting: "Audio Fusion", settingDetails: "Allow Pzizz to play in the background while other audio plays", settingStatus: nil, cellType: .button) {
      print("Audio Fusion")
    }
    
    
    let zeroSection = [newFavorite]
    settingsDataSource.append(zeroSection)
    
    let firstSection = [wakeupTime, sleepAlarmSettings]
    settingsDataSource.append(firstSection)
    
    let secondSection = [dreamScape, narration, voice, loop, music, voiceFade, musicWakeup, threeDeeVoice, threeDeeVoiceSpeed, delayStart]
    settingsDataSource.append(secondSection)
    
    let thirdSection = [ratings, audioFusion]
    settingsDataSource.append(thirdSection)
  }
  
}

//==================================================
// MARK: - TableView DataSource
//==================================================

extension SettingsViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 4
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return 1
    }
    
    return settingsDataSource[section].count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let setting = settingsDataSource[indexPath.section][indexPath.row] as? SettingsModel
    
    if indexPath.section == 0 {
      let collectionViewCell = tableView.dequeueReusableCell(withIdentifier: "favoritesCell") as! FavoritesTableViewCell
      collectionViewCell.setup(with: settingsDataSource[indexPath.section] as! [SettingsFavoritesModel])
      return collectionViewCell
    }
    
    switch setting!.cellType {
    case .button:
      let buttonTypeCell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SwitchSettingsTableViewCell
      buttonTypeCell.setup(with: setting!)
      return buttonTypeCell
    case .label:
      let settingsCell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SleepSettingsTableViewCell
      settingsCell.setup(with: setting!)
      return settingsCell
    }
  }
  
}

//==================================================
// MARK: - TableView Delegate
//==================================================

extension SettingsViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let setting = settingsDataSource[indexPath.section][indexPath.row] as! SettingsModel
    let selectedSetting = setting.action
    selectedSetting()
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    switch section {
    case 1:
      let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! SectionHeaderTableViewCell
      headerCell.sectionHeaderLabel.text = "Alarm Settings"
      return headerCell
    case 2:
      let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! SectionHeaderTableViewCell
      headerCell.sectionHeaderLabel.text = "Sleep Settings"
      return headerCell
    case 3:
      let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! SectionHeaderTableViewCell
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
