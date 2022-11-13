//
//  PosterImageView.swift
//  MvvmMoviesApp
//
//  Created by AHMET HAKAN YILDIRIM on 13.11.2022.
//
/*
 f8119fde7e6f86d5518d42d0f1c12a11
 */
import UIKit

final class PosterImageView: UIImageView {
    
   private var dataTask: URLSessionDataTask?

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func downloadImage(movie:MovieResult){
        
        guard let url = URL(string: APIURLs.imageURL(posterPath: movie._posterPath)) else {return}
        
       dataTask = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {return}
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
        dataTask?.resume()
    }
    
    func cancelDownloading(){
        dataTask?.cancel()
        dataTask = nil
    }
    
}
