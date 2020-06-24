//
//  ExtrensionViewController.swift
//  Davaleba46
//
//  Created by konstantine gudushauri on 6/23/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView.tag {
        case 0:
            return CGSize(width: recentlyplayedcollectionview.frame.size.width/3 + 20, height: recommendedcollectionview.frame.size.height)
        case 1:
            return CGSize(width: recommendedcollectionview.frame.size.width/2 + 20, height: recommendedcollectionview.frame.size.height)
        case 2:
            return CGSize(width: podcastcollectionview.frame.size.width/2 + 20, height: podcastcollectionview.frame.size.height)
        case 3:
            return CGSize(width: artistscollectionview.frame.size.width/3 + 20, height: artistscollectionview.frame.size.height)
        case 4:
            return CGSize(width: genrescollectionview.frame.size.width/2 - 20, height: genrescollectionview.frame.size.height)
        default:
            return CGSize(width: 0, height: 0)
        }
        
    }
}
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView.tag {
        case 0:
            return recentlyPlayed.count
        case 1:
            return recommended.count
        case 2:
            return podcasts.count
        case 3:
            return artists.count
        case 4:
            return genres.count
        default:
            return 0
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView.tag {
        case 0:
            let cell = recentlyplayedcollectionview.dequeueReusableCell(withReuseIdentifier: "recentlyplayed_cell", for: indexPath) as! RecentlyPlayedCollectionViewCell
            let music = recentlyPlayed[indexPath.row]
            cell.img.image = music.image
            cell.title.text = music.title
            return cell
        case 1:
            let cell = recommendedcollectionview.dequeueReusableCell(withReuseIdentifier: "recommended_cell", for: indexPath) as! RecommendedCollectionViewCell
            let music = recommended[indexPath.row]
            cell.img.image = music.image
            cell.title.text = music.title
            cell.artist.text = music.artist
            return cell
        case 2:
            let cell = podcastcollectionview.dequeueReusableCell(withReuseIdentifier: "podcast_cell", for: indexPath) as! PodcastsCollectionViewCell
            let music = podcasts[indexPath.row]
            cell.img.image = music.image
            cell.title.text = music.title
            return cell
        case 3:
            let cell = artistscollectionview.dequeueReusableCell(withReuseIdentifier: "artists_cell", for: indexPath) as! ArtistsCollectionViewCell
            let artist = artists[indexPath.row]
            cell.img.image = artist.image
            cell.title.text = artist.artist
            return cell
        case 4:
            let cell = genrescollectionview.dequeueReusableCell(withReuseIdentifier: "genres_cell", for: indexPath) as! GenresCollectionViewCell
            cell.title.text = genres[indexPath.row]
            return cell
        default:
           return UICollectionViewCell()
        }
    }
}
