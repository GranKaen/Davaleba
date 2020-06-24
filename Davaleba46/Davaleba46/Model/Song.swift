//
//  File.swift
//  Davaleba46
//
//  Created by konstantine gudushauri on 6/23/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import Foundation
struct Playlist: Codable {
    let tracks: SongsResponse
}

// MARK: - Song
struct Song: Codable {
    let artist: Artist
    let album: Album
}

// MARK: - Album
struct Album: Codable {
    let title: String
    let coverBig: String

    enum CodingKeys: String, CodingKey {
        case title
        case coverBig = "cover_big"
    }
}

// MARK: - Artist
struct Artist: Codable {
    let name: String
}

struct SongsResponse: Codable {
    let songs: [Song]
    
    enum CodingKeys: String, CodingKey{
        case songs = "data"
    }
}
