//
//  HomeViewModel.swift
//  MvvmMoviesApp
//
//  Created by AHMET HAKAN YILDIRIM on 10.11.2022.
//

import Foundation

protocol HomeViewModelInterface {
    var view:HomeScreenInterface? {get set}
    func viewDidLoad()
    func getMovies()
}

final class HomeViewModel {
    weak var view: HomeScreenInterface?
    var movies: [MovieResult] = []
    private let service = MovieService()
}

extension HomeViewModel: HomeViewModelInterface {
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionView()
        getMovies()
    }
    func getMovies() {
        service.downloadMovies { [weak self] returnedMovies in
            guard let self = self else {return}
            guard let returnedMovies = returnedMovies else {return}
           // print(returnedMovies)
            self.movies = returnedMovies
        }
    }
}
