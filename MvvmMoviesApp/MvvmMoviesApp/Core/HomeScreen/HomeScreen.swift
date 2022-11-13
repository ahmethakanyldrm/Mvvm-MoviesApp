//
//  HomeScreen.swift
//  MvvmMoviesApp
//
//  Created by AHMET HAKAN YILDIRIM on 7.11.2022.
//

import UIKit

protocol HomeScreenInterface:AnyObject {
    
    func configureVC()
    func configureCollectionView()
    
}

final class HomeScreen: UIViewController {
    
    private let viewModel = HomeViewModel()
    private var collectionView: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self 
        viewModel.viewDidLoad()
        
    }
}

extension HomeScreen: HomeScreenInterface {
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createHomeFlowLayout())
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseID)
        collectionView.pinToEdgesOf(view: view)
    }
    
    func configureVC() {
        view.backgroundColor = .systemBackground
    }
}


extension HomeScreen: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseID, for: indexPath) as! MovieCell

        
        return cell
       
    }
    
    
}
