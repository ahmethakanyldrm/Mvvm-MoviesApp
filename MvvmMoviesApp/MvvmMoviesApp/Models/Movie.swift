//
//  Movie.swift
//  MvvmMoviesApp
//
//  Created by AHMET HAKAN YILDIRIM on 9.11.2022.
//

import Foundation

struct Movie:Codable {
    let results: [MovieResult]?
}

struct MovieResult:Codable {
    let id: Int?
    let posterPath: String?
    let overview,releaseDate,title:String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case overview
        case releaseDate = "release_date"
        case title
    }
    
    var _id: Int {
        id ?? Int.min
    }
    
    var _posterPath: String {
        posterPath ?? ""
    }
}

