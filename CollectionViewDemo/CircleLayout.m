//
//  CircleLayout.m
//  CollectionViewDemo
//
//  Created by Estrella on 2018/1/9.
//  Copyright © 2018年 Estrella. All rights reserved.
//

#import "CircleLayout.h"

@interface CircleLayout ()

@property (nonatomic, strong) NSMutableArray *attrbuteArray;

@end

@implementation CircleLayout

- (NSMutableArray *)attrbuteArray
{
    if (!_attrbuteArray) {
        _attrbuteArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return _attrbuteArray;
}

- (void)prepareLayout
{
    [super prepareLayout];
    
    _itemCount = [self.collectionView numberOfItemsInSection:0];
    CGFloat radius = self.collectionView.frame.size.width/2;
    CGPoint center = CGPointMake(self.collectionView.frame.size.width/2, self.collectionView.frame.size.height/2);
    for (int i = 0; i < _itemCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.size = CGSizeMake(50, 50);
        CGFloat x = center.x + cosf(2*M_PI/_itemCount*i)*(radius-25);
        CGFloat y = center.y + sinf(2*M_PI/_itemCount*i)*(radius-25);
        attributes.center = CGPointMake(x, y);
        [self.attrbuteArray addObject:attributes];
    }
}

- (CGSize)collectionViewContentSize{
    return self.collectionView.frame.size;
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrbuteArray;
}@end
