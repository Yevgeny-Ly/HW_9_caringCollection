//
//  ViewController.swift
//  HW #9 caringCollection
//
//  Created by Евгений Л on 25.07.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private var gallaryCollectionView = GallaryCollectionView()
    
    private var labelNameCollection: UILabel = {
        let label                        = UILabel()
        label.text                       = "Collection"
        label.font                       = UIFont(name: "HelveticaNeue-Bold" , size: 35)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(gallaryCollectionView)
        gallaryCollectionView.addSubview(labelNameCollection)
        
        fastenConstraint()
    }
    
    private func fastenConstraint() {
        [gallaryCollectionView, labelNameCollection].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            gallaryCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            gallaryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gallaryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gallaryCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            labelNameCollection.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            labelNameCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
    }
}

