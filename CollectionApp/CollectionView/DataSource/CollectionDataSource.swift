//
//  CollectionDataSource.swift
//  CollectionApp
//
//  Created by Oleksandr Lukashuk on 23.08.2021.
//

import UIKit

class CollectionDataSource: NSObject, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.nibLoadableReusableCell(with: ExpandableCollectionViewCell.self, indexPath: indexPath)
        return cell
    }
}
