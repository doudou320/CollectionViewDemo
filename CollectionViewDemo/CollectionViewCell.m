//
//  CollectionViewCell.m
//  CollectionViewDemo
//
//  Created by Estrella on 2018/1/4.
//  Copyright © 2018年 Estrella. All rights reserved.
//

#import "CollectionViewCell.h"

@interface CollectionViewCell()

@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.contentView.backgroundColor = [UIColor greenColor];
}
@end
