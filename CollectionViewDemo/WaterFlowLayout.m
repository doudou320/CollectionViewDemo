//
//  WaterFlowLayout.m
//  CollectionViewDemo
//
//  Created by Estrella on 2018/1/5.
//  Copyright © 2018年 Estrella. All rights reserved.
//

#import "WaterFlowLayout.h"


@interface WaterFlowLayout ()
{
    NSMutableArray *_arrtributeArray;
}

@end

@implementation WaterFlowLayout

- (void)prepareLayout
{
    [super prepareLayout];
    
    _arrtributeArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    CGFloat itemWidth = ([UIScreen mainScreen].bounds.size.width-self.sectionInset.left-self.sectionInset.right-self.minimumLineSpacing)/2;
    
    CGFloat colHeight[2] = {self.sectionInset.top,self.sectionInset.bottom};
    
    for (int i = 0; i < self.itemCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        CGFloat height = arc4random()%150+50;
        int column = 0;
        if (colHeight[0] < colHeight[1]) {
            colHeight[0] = colHeight[0]+height+self.minimumLineSpacing;
            column = 0;
        }else{
            colHeight[1] = colHeight[1]+height+self.minimumLineSpacing;
            column = 1;
        }
        attributes.frame = CGRectMake(self.sectionInset.left+(itemWidth+self.minimumLineSpacing)*column, colHeight[column]-height-self.minimumLineSpacing, itemWidth, height);
        [_arrtributeArray addObject:attributes];
    }
    
    if (colHeight[0] > colHeight[1]) {
        self.itemSize = CGSizeMake(itemWidth, (colHeight[0]-self.sectionInset.top)*2/_itemCount-self.minimumLineSpacing);
    }else{
        self.itemSize = CGSizeMake(itemWidth, (colHeight[1]-self.sectionInset.top)*2/_itemCount-self.minimumLineSpacing);
    }
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return _arrtributeArray;
}

@end
