//
//  TrendingController.swift
//  Davaleba46
//
//  Created by konstantine gudushauri on 6/23/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class TrendingController: UIViewController {
    @IBOutlet weak var genresCollectionView: UICollectionView!
    @IBOutlet weak var trendingCollectionView: UICollectionView!
    
    let viewModel = SongsViewModel()
        var songs = [Song]()
        
        let genres = ["All", "Hip-hop", "Podcasts", "Algoritmebi", "K-POP", "Jazz"]
        
        override func viewDidLoad() {
            super.viewDidLoad()

            genresCollectionView.delegate = self
            genresCollectionView.dataSource = self
            genresCollectionView.register(UINib(nibName: "GenresCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "genres_cell")
            
            viewModel.getObjects { (objects) in
                self.songs.append(contentsOf: objects)
                DispatchQueue.main.async {
                    self.trendingCollectionView.reloadData()
                }
            }
            
            trendingCollectionView.delegate = self
            trendingCollectionView.dataSource = self
            trendingCollectionView.register(UINib(nibName: "SongsCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "songs_cell")
        }

    }

    
