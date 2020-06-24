//
//  File.swift
//  Davaleba46
//
//  Created by konstantine gudushauri on 6/23/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import Foundation
struct SongsViewModel {
    
    
    public var getObjects = { (completion: @escaping ([Song]) -> ()) in
    
        var songs = [Song]()
        let apiService = APIService()
        
        apiService.getSongs(completion: { (playlist) in
            songs.append(contentsOf: playlist.tracks.songs)
            completion(songs)
        })
    }
}
