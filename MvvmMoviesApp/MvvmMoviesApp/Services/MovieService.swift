//
//  MovieService.swift
//  MvvmMoviesApp
//
//  Created by AHMET HAKAN YILDIRIM on 9.11.2022.
//

import Foundation

final class MovieService {
    // NetworkManager la iletişimde olacak
    // indirme işlemini vs yapacak
    
    func downloadMovies(page: Int, completion: @escaping ([MovieResult]?)-> ()) {
        guard let url = URL(string: APIURLs.movies(page: page)) else {return}
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
    
    func downloadDetail(id:Int, completion: @escaping (MovieResult?)-> ()){
        
        guard let url = URL(string: APIURLs.detail(id: id)) else {return}
        NetworkManager.shared.download(url: url) { [weak self] result in
            
            guard let self = self else {return}
            
            switch result {
            case .success(let data):
                break
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
