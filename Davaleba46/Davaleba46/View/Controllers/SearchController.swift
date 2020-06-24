//
//  SearchController.swift
//  Davaleba46
//
//  Created by konstantine gudushauri on 6/23/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class SearchController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var songsCollectionView: UICollectionView!
    
    let viewModel = SongsViewModel()
        var songs = [Song]()
        var filteredSongs = [Song]()
        
        override func viewDidLoad() {
            super.viewDidLoad()

            searchBar.delegate = self
            songsCollectionView.delegate = self
            songsCollectionView.dataSource = self
            songsCollectionView.register(UINib(nibName: "SearchedSongCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "search_cell")
            
            viewModel.getObjects { (objects) in
                self.songs.append(contentsOf: objects)
                DispatchQueue.main.async {
                    self.songsCollectionView.reloadData()
                }
            }
        }
        

    }
    

