//
//  PickViewLayout.m
//  CollectionViewDemo
//
//  Created by Estrella on 2018/1/10.
//  Copyright © 2018年 Estrella. All rights reserved.
//

#import "PickViewLayout.h"

@interface PickViewLayout ()

//@property (nonatomic, strong) NSMutableArray *
@end

@implementation PickViewLayout

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *attributeArray = [[NSMutableArray alloc] initWithCapacity:0];
    // 遍历每个item的布局属性
    for (int i = 0; i < [self.collectionView numberOfItemsInSection:0]; i++) {
        [attributeArray addObject:[self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]]];
    }
    return attributeArray;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 创建一个attributes
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    // 获取item的个数
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    // 设置每个item的大小
    attributes.size = CGSizeMake(260, 100);
    attributes.center = CGPointMake(self.collectionView.frame.size.width/2, self.collectionView.frame.size.height/2+self.collectionView.contentOffset.y);
    CATransform3D trans3d = CATransform3DIdentity;
    trans3d.m34 = -1/2000.0;
    float radius = 50/tanf(M_PI*2/itemCount/2);
    // 回去当前偏移量
    float offset = self.collectionView.contentOffset.y;
    float angleOffset = offset/self.collectionView.frame.size.height;
    CGFloat angle = (float)(indexPath.row+angleOffset-1)/itemCount*M_PI*2;
    trans3d = CATransform3DRotate(trans3d, angle, 1.0, 0, 0);
    trans3d = CATransform3DTranslate(trans3d, 0, 0, radius);
    
    // 进行设置
    attributes.transform3D = trans3d;
    return attributes;
}

- (CGSize)collectionViewContentSize
{
    return CGSizeMake(self.collectionView.frame.size.width, self.collectionView.frame.size.height*([self.collectionView numberOfItemsInSection:0]+2));
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
@end
