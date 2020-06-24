//
//  ExtensionTrending.swift
//  Davaleba46
//
//  Created by konstantine gudushauri on 6/23/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import Foundation
import UIKit

extension TrendingController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 0:
            return CGSize(width: genresCollectionView.frame.size.width/2 - 20, height: genresCollectionView.frame.size.height)
        case 1:
            return CGSize(width: trendingCollectionView.frame.size.width, height: 115)
        default:
            return CGSize(width: 0, height: 0)
        }
        
    }
}
extension TrendingController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return genres.count
        case 1:
            return songs.count
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView.tag {
        case 0:
            let cell = genresCollectionView.dequeueReusableCell(withReuseIdentifier: "genres_cell", for: indexPath) as! GenresCollectionViewCell
            cell.title.text = genres[indexPath.row]
            return cell
        case 1:
            let cell = trendingCollectionView.dequeueReusableCell(withReuseIdentifier: "songs_cell", for: indexPath) as! SongsCollectionViewCell
            let song = songs[indexPath.row]
            song.album.coverBig.downloadImage { (image) in
                DispatchQueue.main.async {
                    cell.img.image = image
                }
            }
            cell.num.text = "#" + String(describing: indexPath.row)
            cell.title.text = song.album.title
            cell.artist.text = song.artist.name
            return cell
        default:
            return UICollectionViewCell()
        }
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
    
}
