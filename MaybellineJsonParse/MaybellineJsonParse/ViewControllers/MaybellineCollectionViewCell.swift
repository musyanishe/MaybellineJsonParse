//
//  MaybellineCollectionViewCell.swift
//  MaybellineJsonParse
//
//  Created by Евгения Шевцова on 09.04.2022.
//

import UIKit

class MaybellineCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet var imageLink: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    func configure(with maybelline: Maybelline) {
        nameLabel.text = maybelline.name
        priceLabel.text = maybelline.price
        descriptionLabel.text = maybelline.description
        
        guard let url = URL(string: maybelline.image_link ?? "") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No description found")
                return
            }
            DispatchQueue.main.async {
                self.imageLink.image = UIImage(data: data)
            }
        }.resume()
    }
    
}
