//
//  NetworkMaybellineManager.swift
//  MaybellineJsonParse
//
//  Created by Евгения Шевцова on 09.04.2022.
//

import Foundation

struct NetworkMaybellineManager {
    
    static let shared = NetworkMaybellineManager()
    
    let urlAPI = "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"
    
    func fetchMaybellineInfo(from url: String, completion: @escaping ([Maybelline]?, Error?) -> ()) {
        guard let url = URL(string: urlAPI) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No errors")
                return
            }
            do {
                let maybs = try JSONDecoder().decode([Maybelline].self, from: data)
                completion(maybs, nil)
            } catch let error {
                completion(nil, error)
                print(error)
            }
        }.resume()
    }
    
    init() {}
}
