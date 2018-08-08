//
//  CategoryCollectionViewCell.h
//
//  Created by Shoaib Ahmed Qureshi on 6/2/14.
//
//

#import <UIKit/UIKit.h>
#import "ItemDetail.h"

@interface CategoryCollectionViewCell : UICollectionViewCell

@property(nonatomic,weak) IBOutlet UIImageView* feedImage;

-(void)setData:(ItemDetail*)feed;

@end
