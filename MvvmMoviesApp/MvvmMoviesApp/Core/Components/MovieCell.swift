//
//  MovieCell.swift
//  MvvmMoviesApp
//
//  Created by AHMET HAKAN YILDIRIM on 10.11.2022.
//

import UIKit

class MovieCell: UICollectionViewCell {
    static let reuseID = "MovieCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell(){
        backgroundColor = .orange
    }
}
