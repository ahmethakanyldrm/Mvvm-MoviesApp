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
    func reloadCollectionView()
    
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
    
    func reloadCollectionView(){
        collectionView.reloadOnMainThread()
    }
}


extension HomeScreen: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseID, for: indexPath) as! MovieCell
        cell.setCell(movie: viewModel.movies[indexPath.item])
        return cell
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(APIURLs.detail(id: viewModel.movies[indexPath.item]._id))
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let offsetY = scrollView.contentOffset.y
//        let contentHeight = scrollView.contentSize.height
//        let height = scrollView.frame.size.height
//
//        guard contentHeight != 0 else {return}
//
//        if offsetY >= contentHeight - (2 * height) && viewModel.shouldDownloadMore {
//           viewModel.getMovies()
//            //print("get")
//        }
//
//    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height

        if offsetY >= contentHeight - (2 * height) {
            viewModel.getMovies()
        }
    }
    
}
