//
//  wangyiVC.swift
//  cardCollectionView
//
//  Created by zhn on 16/3/29.
//  Copyright © 2016年 zhn. All rights reserved.
//

import UIKit

class wangyiVC: UICollectionViewController {
 
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cells", forIndexPath: indexPath)
        cell.backgroundColor = randomThecolor()
        return cell
    }

    func randomThecolor() -> UIColor{
        
        let max: UInt32 = 255
        let min: UInt32 = 0
        let randomNum:CGFloat = CGFloat(arc4random_uniform(max - min) + min)
        print(randomNum)
        return UIColor(red: randomNum*0.6/255.0, green: randomNum*0.2/255.0, blue: randomNum*0.7/255.0, alpha: 1.0)
    }

}
