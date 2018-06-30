//
//  ViewController.swift
//  SongUITableView
//
//  Created by 蔡致宸 on 2018/6/26.
//  Copyright © 2018年 蔡致宸. All rights reserved.
//

import UIKit

struct Song {
    var singer_Name: String?
    var song_Name: String?
    var image: UIImage
    init(singer: String, song:String, image:UIImage) {
        self.singer_Name = singer
        self.song_Name = song
        self.image = image
    }
}

class TableViewController: UITableViewController {
    
    
    let cellID = "songcell"
    // MARK: - Section collection
    var songs: [[Song]] = []
    // MARK: - Section1
    let song = [
        
        Song(singer: "林俊傑", song: "偉大的渺小", image: #imageLiteral(resourceName: "偉大的渺小")),
        Song(singer: "林宥嘉", song: "天真有邪", image: #imageLiteral(resourceName: "今日營業中")),
        Song(singer: "盧廣仲", song: "幾分之幾", image:#imageLiteral(resourceName: "幾分之幾")),
        
    ]
    // MARK: - Section2
    var info = [
        
        Song(singer: "茄子蛋", song: "浪子回頭", image: #imageLiteral(resourceName: "茄子蛋")),
        Song(singer: "頑童MJ116", song: "幹大事", image: #imageLiteral(resourceName: "幹大事.jpg") )
    ]
    
    fileprivate func setupInit() {
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.title = "我的歌單"
        songs.append(song)
        songs.append(info)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
        setupInit()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.songs.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    let sectionName = ["華語主流", "華語新人"]
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionName[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.songs[section].count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = indexPath.section
        let row = indexPath.row
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
        
        let theSong = self.songs[section][row]
        cell.textLabel?.text = theSong.song_Name
        cell.detailTextLabel?.text = theSong.singer_Name
        cell.imageView?.image = theSong.image
        
        return cell
    }
}

