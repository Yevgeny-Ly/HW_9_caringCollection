//
//  CollectionView.swift
//  HW #9 caringCollection
//
//  Created by Евгений Л on 25.07.2023.
//

import UIKit

struct Constants {
    static let leftDistanceToView: CGFloat         = 7
    static let rightDistanceToView: CGFloat        = 7
    static let galleryMinimumLineSpaicing: CGFloat = 10
    static let galleryItemWidth                    = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.galleryMinimumLineSpaicing)) / 1.3
}

class GallaryCollectionView: UICollectionView {
    
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(frame: .zero, collectionViewLayout: layout)
        
        layout.scrollDirection = .horizontal
        dataSource             = self
        delegate               = self
        register(UICollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseId)
        
        showsHorizontalScrollIndicator            = false
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing                 = Constants.galleryMinimumLineSpaicing
        contentInset                              = UIEdgeInsets(top: 0,
                                                                 left: Constants.leftDistanceToView,
                                                                 bottom: 0,
                                                                 right: Constants.rightDistanceToView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GallaryCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseId, for: indexPath)
        cell.backgroundColor = .systemGray5
        cell.layer.cornerRadius = 10
        cell.layer.shadowRadius = 5
        cell.layer.shadowOpacity = 0.1
        cell.layer.shadowOffset = CGSize(width: 4, height: 2)
        return cell
    }
}

extension GallaryCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: Constants.galleryItemWidth, height: frame.height - 400)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let scrolledOffset = targetContentOffset.pointee.x + scrollView.contentInset.left
        let cellWidht = Constants.galleryItemWidth + Constants.galleryMinimumLineSpaicing
        let index = round(scrolledOffset / cellWidht)
        targetContentOffset.pointee = CGPoint(x: index * cellWidht - scrollView.contentInset.left,
                                              y: scrollView.contentInset.top)
    }
}
