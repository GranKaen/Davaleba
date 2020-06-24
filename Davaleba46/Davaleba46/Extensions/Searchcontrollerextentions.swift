//
//  Searchcontrollerextentions.swift
//  Davaleba46
//
//  Created by konstantine gudushauri on 6/23/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import Foundation
import UIKit

extension SearchController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: songsCollectionView.frame.size.width, height: 71)
    }
}
extension SearchController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredSongs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = songsCollectionView.dequeueReusableCell(withReuseIdentifier: "search_cell", for: indexPath) as! SearchedSongCollectionViewCell
        let song = filteredSongs[indexPath.row]
        song.album.coverBig.downloadImage { (image) in
            DispatchQueue.main.async {
                cell.img.image = image
            }
        }
        cell.title.text = song.album.title
        cell.artist.text = song.artist.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
}

extension SearchController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty == false {
            filteredSongs = songs.filter({ $0.artist.name.contains(searchText) || $0.album.title.contains(searchText) })
            songsCollectionView.reloadData()
        } else {
            filteredSongs.removeAll()
            songsCollectionView.reloadData()
        }
    }
}
