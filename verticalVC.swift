//
//  verticalVC.swift
//  cardCollectionView
//
//  Created by zhn on 16/3/29.
//  Copyright © 2016年 zhn. All rights reserved.
//

import UIKit

class verticalVC: UICollectionViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0)
    }
    
    
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cells", forIndexPath: indexPath)
        return cell
    }
    
}
