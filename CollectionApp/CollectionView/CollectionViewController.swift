//
//  CollectionViewController.swift
//  CollectionApp
//
//  Created by Oleksandr Lukashuk on 23.08.2021.
//

import UIKit

class CollectionViewController: UIViewController {
    @IBOutlet private weak var containerView: UIView!
    
    private let collectionDataSource = CollectionDataSource()
    private lazy var collectionView: UICollectionView = {
        let layot = JumpAvoidingFlowLayout()
        layot.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layot)
        collection.showsVerticalScrollIndicator = false
        collection.allowsMultipleSelection = true
        collection.alwaysBounceVertical = true
        collection.delegate = self
        collection.dataSource = collectionDataSource
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    private func configureView() {
        title = "Главная"
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        
        collectionView.register(cellType: ExpandableCollectionViewCell.self)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
    }
}

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        collectionView.deselectItem(at: indexPath, animated: true)
        collectionView.performBatchUpdates(nil)
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        collectionView.performBatchUpdates(nil)
        DispatchQueue.main.async {
            collectionView.scrollToItem(at: indexPath, at: .top, animated: true)
        }
        
        return true
    }
}


extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let isSelected = collectionView.indexPathsForSelectedItems?.contains(indexPath) ?? false
        return CGSize(width: collectionView.bounds.width - 40, height: isSelected ? 150 : 50)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        24
    }
}
