//
//  MovieService.swift
//  MvvmMoviesApp
//
//  Created by AHMET HAKAN YILDIRIM on 9.11.2022.
//

import Foundation

class MovieService {
    // NetworkManager la iletişimde olacak
    // indirme işlemini vs yapacak
    
    func downloadMovies(completion: @escaping ([MovieResult]?)-> ()) {
        guard let url = URL(string: APIURLs.movies(page: 1)) else {return}
        // weak self memory leak olmaması için kullanılması gerekli
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else {return}
            
            switch result {
            case .success(let data):
                 completion(self.handleWithData(data))
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    private func handleWithError(_ error:Error) {
        print(error.localizedDescription)
    }
    
    private func handleWithData(_ data: Data) -> [MovieResult]? {
        do {
             let movie = try JSONDecoder().decode(Movie.self, from: data)
             return movie.results
        } catch  {
            print(error.localizedDescription)
            return nil
        }
        
    }
}
