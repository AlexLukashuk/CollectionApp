//
//  ExpandableCollectionViewCell.swift
//  CollectionApp
//
//  Created by Oleksandr Lukashuk on 23.08.2021.
//

import UIKit

class ExpandableCollectionViewCell: UICollectionViewCell, NibLoadable {
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var headerView: UIView!
    @IBOutlet private weak var headerImage: UIImageView!
    @IBOutlet private weak var bodyView: UIView!
    
    override var isSelected: Bool {
        didSet {
            updateAppearance()
        }
    }
    
    override func awakeFromNib() {
        contentView.layer.cornerRadius = 12
        contentView.clipsToBounds = true
        
        bodyView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: nil))
    }
    
    private func updateAppearance() {
        UIView.animate(withDuration: 0.4) {
            let upsideDown = CGAffineTransform(rotationAngle: .pi * -0.999 )
            self.headerImage.transform = self.isSelected ? upsideDown : .identity
        }
    }
}
