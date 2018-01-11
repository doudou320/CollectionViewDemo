//
//  PickViewViewController.m
//  CollectionViewDemo
//
//  Created by Estrella on 2018/1/10.
//  Copyright © 2018年 Estrella. All rights reserved.
//

#import "PickViewViewController.h"
#import "PickViewLayout.h"

@interface PickViewViewController () <UICollectionViewDelegate,UICollectionViewDataSource>

{
    UICollectionView *_collectionView;
}

@end

@implementation PickViewViewController

-(void)viewDidLoad{
    
    PickViewLayout * layout = [[PickViewLayout alloc]init];
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(10, 50, 320, 400) collectionViewLayout:layout];
    _collectionView.contentOffset = CGPointMake(0, 400);
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    [self.view addSubview:_collectionView];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 250, 80)];
    label.text = [NSString stringWithFormat:@"我是第%ld行",(long)indexPath.row];
    [cell.contentView addSubview:label];
    return cell;
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //小于半屏 则放到最后一屏多半屏
    if (scrollView.contentOffset.y<200) {
        scrollView.contentOffset = CGPointMake(0, scrollView.contentOffset.y+10*400);
        //大于最后一屏多一屏 放回第一屏
    }else if(scrollView.contentOffset.y>11*400){
        scrollView.contentOffset = CGPointMake(0, scrollView.contentOffset.y-10*400);
    }
}
@end
