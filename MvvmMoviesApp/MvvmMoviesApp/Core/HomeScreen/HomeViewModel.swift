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
    private var page: Int = 1
    //var shouldDownloadMore : Bool = true
}

extension HomeViewModel: HomeViewModelInterface {
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionView()
        getMovies()
    }
    func getMovies() {
        //shouldDownloadMore = false
        service.downloadMovies(page: page) { [weak self] returnedMovies in
            guard let self = self else {return}
            guard let returnedMovies = returnedMovies else {return}
           // print(returnedMovies)
            self.movies.append(contentsOf: returnedMovies)
            self.page += 1
            self.view?.reloadCollectionView()
            //self.shouldDownloadMore = true 
        }
    }
}
