//
//  NetworkMaybellineManager.swift
//  MaybellineJsonParse
//
//  Created by Евгения Шевцова on 09.04.2022.
//

import Foundation

struct NetworkMaybellineManager {
    
    enum Result<Success, Error: Swift.Error> {
        case success(Success)
        case failure(Error)
    }
    
    static let shared = NetworkMaybellineManager()
    
    let urlAPI = "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"
    
    func fetchMaybellineInfo(from url: String, completion: @escaping (Result<[Maybelline], Error>) -> ()) {
        guard let url = URL(string: urlAPI) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(error!))
                return
            }
            do {
                guard let maybs = try? JSONDecoder().decode([Maybelline].self, from: data) else {
                    completion(.failure(error!))
                    return
                }
                completion(.success(maybs))
            }
        }.resume()
    }
    
    init() {}
}
