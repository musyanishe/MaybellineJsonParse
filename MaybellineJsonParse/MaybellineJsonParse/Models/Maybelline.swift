//
//  Maybelline.swift
//  MaybellineJsonParse
//
//  Created by Евгения Шевцова on 09.04.2022.
//

import Foundation

struct Maybelline {
    let nameOfProduct: String
    let imageOfProduct: String
    let descriptionOfProduct: String
    let priceOfProduct: String
    
    init?(maybellineData: MaybellineData) {
        nameOfProduct = maybellineData.name
        imageOfProduct = maybellineData.image_link
        descriptionOfProduct = maybellineData.description
        priceOfProduct = maybellineData.price
    }
}
