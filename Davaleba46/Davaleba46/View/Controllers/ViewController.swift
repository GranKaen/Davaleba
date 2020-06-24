//
//  ViewController.swift
//  Davaleba46
//
//  Created by konstantine gudushauri on 6/22/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var recentlyplayedcollectionview: UICollectionView!
    
    @IBOutlet weak var recommendedcollectionview: UICollectionView!
    
    @IBOutlet weak var podcastcollectionview: UICollectionView!
    
    
    @IBOutlet weak var artistscollectionview: UICollectionView!
    
    @IBOutlet weak var genrescollectionview: UICollectionView!
    
    
 let recentlyPlayed = [
            Music(image: UIImage(named: "im-cover1")!, title: "061 Marketing..."),
            Music(image: UIImage(named: "im-cover2")!, title: "Lights"),
            Music(image: UIImage(named: "im-cover3")!, title: "Sounds Like G..."),
            Music(image: UIImage(named: "im-cover4")!, title: "Havana")
        ]
        
        let recommended = [
            Music(image: UIImage(named: "im-cover5")!, title: "Bass Rani", artist: "Nucleya"),
            Music(image: UIImage(named: "im-cover6")!, title: "Gully Boy", artist: "Various Artists"),
            Music(image: UIImage(named: "im-cover7")!, title: "X", artist: "Ed Sheeran"),
            Music(image: UIImage(named: "im-cover8")!, title: "Kohinoor", artist: "DIVINE")
        ]
        
        let podcasts = [
            Music(image: UIImage(named: "im-cover9")!, title: "The GaryVee Audio Experience"),
            Music(image: UIImage(named: "im-cover3")!, title: "Wireframe"),
            Music(image: UIImage(named: "im-cover11")!, title: "Design Better Podcast"),
            Music(image: UIImage(named: "im-cover1")!, title: "The Futur Podcast"),
        ]
        
        let artists = [
            Music(image: UIImage(named: "im-cover13")!, artist: "DIVINE"),
            Music(image: UIImage(named: "im-cover14")!, artist: "DJ Snake"),
            Music(image: UIImage(named: "im-cover15")!, artist: "RITVIZ"),
            Music(image: UIImage(named: "im-cover16")!, artist: "Nucleya"),
            Music(image: UIImage(named: "im-cover17")!, artist: "David Guetta")
        ]
        
        let genres = ["Pop", "Hip-hop", "Jazz", "Electronic", "Folk"]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            recentlyplayedcollectionview.delegate = self
            recentlyplayedcollectionview.dataSource = self
            recentlyplayedcollectionview.register(UINib(nibName: "RecentlyPlayedCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "recentlyplayed_cell")
            
            recommendedcollectionview.delegate = self
            recommendedcollectionview.dataSource = self
            recommendedcollectionview.register(UINib(nibName: "RecommendedCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "recommended_cell")
            
            podcastcollectionview.delegate = self
            podcastcollectionview.dataSource = self
            podcastcollectionview.register(UINib(nibName: "PodcastsCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "podcasts_cell")
            
            artistscollectionview.delegate = self
            artistscollectionview.dataSource = self
            artistscollectionview.register(UINib(nibName: "ArtistsCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "artists_cell")
            
            genrescollectionview.delegate = self
            genrescollectionview.dataSource = self
            genrescollectionview.register(UINib(nibName: "GenresCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "genres_cell")
            
        }

    }

    


