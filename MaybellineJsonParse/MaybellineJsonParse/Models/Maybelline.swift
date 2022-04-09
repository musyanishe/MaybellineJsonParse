//
//  Maybelline.swift
//  MaybellineJsonParse
//
//  Created by Евгения Шевцова on 09.04.2022.
//

import Foundation

struct Maybelline: Decodable {
    let name: String
    let image_link: String
    let description: String
    let price: String
}
