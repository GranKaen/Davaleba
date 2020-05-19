//
//  SimgerebisVC.swift
//  Davaleba24
//
//  Created by Kote Ghudushauri on 5/19/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit
struct Song: Codable {
    let title: String
}
struct Bands: Codable {
    let data: [Datum]
}
struct Datum: Codable {
    let band: String
    let songs: [Song]
}
class SimgerebisVC: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var bandinfo: UILabel!
    var index = 0
    var band = ""
    var info = ""
    var songs = [Song]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        getSong()
        bandinfo.text = info
        // Do any additional setup after loading the view.
    }
    
   func getSong() {
       let url = URL(string: "http://www.mocky.io/v2/5ec3ca1c300000e5b039c407")!
       URLSession.shared.dataTask(with: url) { (data, res, err) in
           
           guard let data = data else {return}
           
           do {
               let decoder = JSONDecoder()
               let songResponse = try decoder.decode(Bands.self, from: data)
               
               self.songs.append(contentsOf: songResponse.data[self.index].songs)
               DispatchQueue.main.async {
                   self.tableview.reloadData()
               }
           } catch {print(error.localizedDescription)}
           
       }.resume()
   }
}
extension SimgerebisVC: UITableViewDelegate{
    
}
extension SimgerebisVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let song = songs[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "simgerebicell_id") as! SimgerebiCell
        cell.nameoncell.text = song.title
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
            let lyricVC = storyboard?.instantiateViewController(identifier: "lyrics_id") as! LyricsVC
            let song = songs[indexPath.row]
            lyricVC.songaddress = "\(band)/\(song.title)"
            navigationController?.pushViewController(lyricVC, animated: true)
        }
    
}

