//
//  NetworkManager.swift
//  MvvmMoviesApp
//
//  Created by AHMET HAKAN YILDIRIM on 7.11.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    @discardableResult // dönüş tipini opsiyonel yapar 
    func download(url:URL, completion: @escaping (Result<Data,Error>)->()) -> URLSessionDataTask{
       let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
                return
            }
            guard
                let response = response as? HTTPURLResponse,
                response.statusCode == 200
            else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            guard
                let data = data else {
                completion(.failure(URLError(.badURL)))
                return
            }
            completion(.success(data))
            
        }
        dataTask.resume()
        
        return dataTask
        
    }
}
