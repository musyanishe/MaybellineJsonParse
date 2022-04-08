//
//  ViewController.swift
//  MaybellineJsonParse
//
//  Created by Евгения Шевцова on 09.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
//    var maybelline: Maybelline
    
    private let cellScale: CGFloat = 0.6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScale)
        let cellHeight = floor(screenSize.height * cellScale)
        let insertX = (view.bounds.width - cellWidth) / 2
        let insertY = (view.bounds.height - cellHeight) / 2
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView.contentInset = UIEdgeInsets(top: insertY, left: insertX, bottom: insertY, right: insertX)
        
//        collectionView.dataSource = self
    }
}


    //MARK: - UICollectionViewDataSource
//extension ViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MaybellineCollectionViewCell", for: indexPath) as! MaybellineCollectionViewCell
//        let maybellines = maybelline[indexPath.item]
//        cell.maybellines = maybellines
//
//        return cell
//    }
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        1
//    }
//}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 40, height: 580)
    }
}
