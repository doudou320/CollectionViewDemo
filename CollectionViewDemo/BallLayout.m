//
//  BallLayout.m
//  CollectionViewDemo
//
//  Created by Estrella on 2018/1/11.
//  Copyright © 2018年 Estrella. All rights reserved.
//

#import "BallLayout.h"

@implementation BallLayout
- (void)prepareLayout
{
    [super prepareLayout];
}

- (CGSize)collectionViewContentSize
{
    return CGSizeMake(self.collectionView.frame.size.width*([self.collectionView numberOfItemsInSection:0]+2),self.collectionView.frame.size.height*([self.collectionView numberOfItemsInSection:0]+2));
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *arrayM = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [self.collectionView numberOfItemsInSection:0]; i++) {
        [arrayM addObject:[self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]]];
    }
    return arrayM;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    int itemCount = (int)[self.collectionView numberOfItemsInSection:0];
    attributes.center = CGPointMake(self.collectionView.frame.size.width/2+self.collectionView.contentOffset.x, self.collectionView.frame.size.height/2+self.collectionView.contentOffset.y);
    attributes.size = CGSizeMake(30, 30);

    CATransform3D trand3D = CATransform3DIdentity;
    
    trand3D.m34 = -1/900.0;
    
    CGFloat radius = 15/tanf(M_PI*2/itemCount/2);
    // 根据偏移量 改变角度
    // 添加一个x的偏移量
    float offsety = self.collectionView.contentOffset.y;
    float offsetx = self.collectionView.contentOffset.x;
    // 分别计算偏移量的角度
    float angleOffsety = offsety/self.collectionView.frame.size.height;
    float angleOffsetx = offsetx/self.collectionView.frame.size.width;
    CGFloat angle1 = (float)(indexPath.row+angleOffsety-1)/itemCount*M_PI*2;
    CGFloat angle2 = (float)(indexPath.row+angleOffsetx-1)/itemCount*M_PI*2;
    // 这个进行四个方向的排列
    if (indexPath.row%4==1) {
        trand3D = CATransform3DRotate(trand3D, angle1, 1.0, 0, 0);
    }else if (indexPath.row%4==2){
        trand3D = CATransform3DRotate(trand3D, angle2, 0, 1.0, 0);
    }else if (indexPath.row%4==3){
        trand3D = CATransform3DRotate(trand3D, angle1, 0.5, 0.5 ,0);
    }else{
        trand3D = CATransform3DRotate(trand3D, angle1, 0.5, -0.5 ,0);
    }
    
    trand3D = CATransform3DTranslate(trand3D, 0, 0, radius);
    attributes.transform3D = trand3D;
    return attributes;
}
@end
