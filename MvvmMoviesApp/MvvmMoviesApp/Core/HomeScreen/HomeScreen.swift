//
//  HomeScreen.swift
//  MvvmMoviesApp
//
//  Created by AHMET HAKAN YILDIRIM on 7.11.2022.
//

import UIKit

protocol HomeScreenInterface:AnyObject {
    
    func configureVC()
    
}

final class HomeScreen: UIViewController {
    
    private let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self 
        viewModel.viewDidLoad()
        
    }
}

extension HomeScreen: HomeScreenInterface {
    func configureVC() {
        view.backgroundColor = .systemPink
    }
    
    
}
