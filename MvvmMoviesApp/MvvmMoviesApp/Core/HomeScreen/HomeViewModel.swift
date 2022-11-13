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
}


final class HomeViewModel {
     weak var view: HomeScreenInterface?
}


extension HomeViewModel: HomeViewModelInterface {

    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionView()
    }
}
