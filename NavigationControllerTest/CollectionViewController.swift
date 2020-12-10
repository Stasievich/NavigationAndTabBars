//
//  CollectionViewController.swift
//  NavigationControllerTest
//
//  Created by Victor on 12/3/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import UIKit


class CollectionViewController: UIViewController {

    var collectionView: UICollectionView?
    var layoutOne: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .horizontal
        return layout
    }()
    var layoutTwo: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.scrollDirection = .vertical
        return layout
    }()
    let reuseId = "cell"
    
    override func loadView() {
        super.loadView()
        
        navigationController?.navigationBar.prefersLargeTitles = false
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layoutOne)
        collectionView = collection
        view.addSubview(collection)
        collection.fillView(view)
        collection.backgroundColor = .purple
        collection.dataSource = self
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseId)
        collection.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
 
}


extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        50
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath)
        cell.backgroundColor = .systemBlue
        return cell
    }


}

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row % 2 == 0 {
            collectionView.setCollectionViewLayout(layoutOne, animated: true)
        } else {
            collectionView.setCollectionViewLayout(layoutTwo, animated: true)
        }
        
    }
}


extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row % 10 == 0 {
            return CGSize(width: 70, height: 200)
        }
        return CGSize(width: 100, height: 100)
    }
}
