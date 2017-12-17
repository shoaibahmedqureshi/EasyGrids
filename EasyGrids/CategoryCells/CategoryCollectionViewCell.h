//
//  CategoryCollectionViewCell.h
//  StrictlySelfies
//
//  Created by Ali Akbar on 08/10/2015.
//  Copyright (c) 2015 Ali Akbar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetail.h"

@interface CategoryCollectionViewCell : UICollectionViewCell

@property(nonatomic,weak) IBOutlet UIImageView* feedImage;

-(void)setData:(ItemDetail*)feed;

@end
