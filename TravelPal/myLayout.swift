//
//  myLayout.swift
//  ShiXun
//
//  Created by macbook on 2017/4/24.
//  Copyright © 2017年 macbook. All rights reserved.
//

import UIKit

class myLayout: UICollectionViewLayout {
    // 定义collectionView的内容大小 ContentSize
    override var collectionViewContentSize:CGSize {
        return CGSize(width:collectionView!.bounds.size.width,
                      height:collectionView!.bounds.size.height)
    }
    
    // 所有单元格位置属性
    override func layoutAttributesForElements(in rect: CGRect)
        -> [UICollectionViewLayoutAttributes]? {
            var attributesArray = [UICollectionViewLayoutAttributes]()
            //循环遍历 section
            for j in 0..<2
            {
                //获得section里面的元素个数
                let cellCount = self.collectionView!.numberOfItems(inSection: j)
                //循环给每个section里面的元素 定义属性
                for i in 0..<cellCount {
                    let indexPath = IndexPath(item:i,section:j)
                    
                    let attributes =  self.layoutAttributesForItem(at: (indexPath as NSIndexPath) as IndexPath)
                    
                    attributesArray.append(attributes!)
                }
                
            }
            return attributesArray
    }
    
    // 这个方法返回每个单元格的位置和大小
    override func layoutAttributesForItem(at indexPath: IndexPath)
        -> UICollectionViewLayoutAttributes? {
            //当前单元格布局属性
            let attribute =  UICollectionViewLayoutAttributes(forCellWith:indexPath as IndexPath)
            /// 定义宽高
            let width = collectionViewContentSize.width
            let height = collectionViewContentSize.height
            
            //定义单元格frame属性
            if indexPath.section == 0 {
                let cellwidth:CGFloat = width / 4
                let cellHeight:CGFloat = 65
                let num:Int = indexPath.item % 4
                let X = CGFloat(num) * cellwidth
                //？？？？、页眉？
                
                
                attribute.frame = CGRect(x:X, y:2, width:cellwidth, height:cellHeight)
                return attribute
            }
            else
            {
                let cellwidth:CGFloat = width / 4
                let cellHeight:CGFloat = 55
                let line:Int =  indexPath.item / 4
                let num:Int = indexPath.item % 4
                let Y = CGFloat(line) * cellHeight + height/2 //??？？页眉？
                let X = CGFloat(num) * cellwidth
                
                
                attribute.frame = CGRect(x:X, y:Y, width:cellwidth, height:cellHeight)
                return attribute
            }
            
    }

}
