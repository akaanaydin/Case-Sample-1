//
//  iTunesModel.swift
//  CaseSample-1
//
//  Created by Arslan Kaan AYDIN on 16.04.2022.
//

import Foundation


struct ITunesModel: Codable {
    let results: [Result]?
}

struct Result: Codable {
//    let wrapperType: WrapperType?
    let trackName: String?
    let artworkUrl100: String?
    let collectionPrice: Double?
    let releaseDate: Date?
    
    enum CodingKeys: String, CodingKey {
//          case wrapperType
          case trackName
          case artworkUrl100, collectionPrice, releaseDate
      }
}
//enum WrapperType: String, Codable {
//    case track  = "track"
//}
