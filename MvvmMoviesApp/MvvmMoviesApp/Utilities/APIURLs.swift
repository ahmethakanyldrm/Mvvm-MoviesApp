//
//  APIURLs.swift
//  MvvmMoviesApp
//
//  Created by AHMET HAKAN YILDIRIM on 10.11.2022.
//

import Foundation

enum APIURLs {
    static func movies(page: Int) -> String {
           "https://api.themoviedb.org/3/movie/popular?api_key=apikey&language=en-US&page=\(page)"
       }
    
    static func imageURL(posterPath:String) -> String {
        "https://image.tmdb.org/t/p/w500/\(posterPath)"
    }
}
