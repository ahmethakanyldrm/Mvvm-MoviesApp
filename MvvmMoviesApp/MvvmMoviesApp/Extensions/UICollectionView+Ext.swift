//
//  UICollectionView+Ext.swift
//  MvvmMoviesApp
//
//  Created by AHMET HAKAN YILDIRIM on 18.11.2022.
//

import UIKit

extension UICollectionView {
    
    func reloadOnMainThread(){
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
