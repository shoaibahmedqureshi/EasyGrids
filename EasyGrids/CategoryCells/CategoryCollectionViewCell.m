//
//  CategoryCollectionViewCell.m
//
//  Created by Shoaib Ahmed Qureshi on 6/2/14.
//
//

#import "CategoryCollectionViewCell.h"
#import "UtilitiesHelper.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation CategoryCollectionViewCell

- (void)setData:(ItemDetail*)feed
{
    if ([feed.imageUrl length] != 0 && ![feed.imageUrl isKindOfClass: [NSNull class]])
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [UtilitiesHelper addActivityIndicatorToView:_feedImage];
        });
        [imageView sd_setImageWithURL:[NSURL URLWithString:feed.imageUrl]
                     placeholderImage:[UIImage imageNamed:feed.placeholder]
                            completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                dispatch_async(dispatch_get_main_queue(), ^{
                                    [UtilitiesHelper removeActivityIndicatorToView:_feedImage];
                                });
                            }];
    }
    else
    {
        if ([feed.imageName length] != 0 && ![feed.imageName isKindOfClass: [NSNull class]])
        {
            _feedImage.image = [UIImage imageNamed:feed.imageName];
        }
    }
}


@end
