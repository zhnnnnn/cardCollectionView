//
//  horizontalFolowLayout.swift
//  cardCollectionView
//
//  Created by zhn on 16/3/29.
//  Copyright © 2016年 zhn. All rights reserved.
//

import UIKit

class horizontalFolowLayout: UICollectionViewFlowLayout {
    
    var screenWidth:CGFloat?
    var screenHeight:CGFloat?
    
    override func prepareLayout() {
        super.prepareLayout()
        
        screenHeight =  collectionView?.frame.size.height
        screenWidth = collectionView?.frame.size.width
        
        scrollDirection = UICollectionViewScrollDirection.Horizontal
        itemSize = CGSizeMake(screenWidth! - 100, 0.8 * screenHeight!)
        minimumLineSpacing = 30
        sectionInset = UIEdgeInsetsMake(0, 50, 0, 50)
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        // 拿到默认的布局属性
        let attributesAry = super.layoutAttributesForElementsInRect(rect)
        var copyAttributesAry = [UICollectionViewLayoutAttributes]()
        for eachAttribus in attributesAry!{
            
            let newEach = eachAttribus.copy()
            copyAttributesAry.append(newEach as! UICollectionViewLayoutAttributes)
            
        }
        // 滑动时候的可见区域
        let visAbleRect = CGRectMake((collectionView?.contentOffset.x)!, (collectionView?.contentOffset.y)!, screenWidth!, screenHeight!)
        let midX = CGRectGetMidX(visAbleRect)
        
        for eachAttributes in copyAttributesAry{
            
            let distance = eachAttributes.center.x - midX
            let scale = distance / itemSize.width
            let scaleY = 1 - fabs(scale) * 0.2
            
            eachAttributes.transform3D = CATransform3DMakeScale(1.0, scaleY, scaleY)
        }
        
        return copyAttributesAry
    }
    
    
    override func targetContentOffsetForProposedContentOffset(var proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        let floatScale =   proposedContentOffset.x/(itemSize.width + minimumLineSpacing)
        
        proposedContentOffset.x = CGFloat(roundfloat(floatScale)) * CGFloat(itemSize.width + minimumLineSpacing)
        return proposedContentOffset
    }
    
    func roundfloat(floatScale:CGFloat) ->Int{
        
        let intFloat = Int(floatScale)
        
        if(floatScale > CGFloat(intFloat) + 0.5){
            return intFloat + 1
        }else{
            return intFloat
        }

    }

}
