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
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
    }
}

