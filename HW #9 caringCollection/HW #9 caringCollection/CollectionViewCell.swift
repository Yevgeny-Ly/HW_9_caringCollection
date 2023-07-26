//
//  UICollectionViewCell.swift
//  HW #9 caringCollection
//
//  Created by Евгений Л on 25.07.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let reuseId = NSStringFromClass(CollectionViewCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder): has not been implemented")
    }
}
