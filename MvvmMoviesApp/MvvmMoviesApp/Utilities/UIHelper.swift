//
//  UIHelper.swift
//  MvvmMoviesApp
//
//  Created by AHMET HAKAN YILDIRIM on 10.11.2022.
//

import UIKit

enum UIHelper {
    static func createHomeFlowLayout () -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let itemWidth = CGFloat.deviceWidth
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.5)
        layout.minimumLineSpacing = 40
        return layout
    }
}
