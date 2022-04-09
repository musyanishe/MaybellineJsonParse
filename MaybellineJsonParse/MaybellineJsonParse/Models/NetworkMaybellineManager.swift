//
//  NetworkMaybellineManager.swift
//  MaybellineJsonParse
//
//  Created by Евгения Шевцова on 09.04.2022.
//

import Foundation

struct NetworkMaybellineManager {
    
    var onCompletion: ((Maybelline) -> Void)?
    
    func fetchMaybellineInfo() {
        guard let url = URL(string: "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                if let maybelline = self.parseJSON(withData: data) {
                    self.onCompletion?(maybelline)
                }
            }
        }.resume()
    }
    
    func parseJSON(withData data: Data) -> Maybelline? {
        let decoder = JSONDecoder()
        do {
            let maybellineData = try decoder.decode(MaybellineData.self, from: data)
            guard let maybelline = Maybelline(maybellineData: maybellineData)
            else {
                return nil
            }
            return maybelline
        } catch let error {
            print(error.localizedDescription)
        }
        return nil
    }
    
}
