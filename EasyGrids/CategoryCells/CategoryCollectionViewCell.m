//
//  CategoryCollectionViewCell.m
//
//  Created by Shoaib Ahmed Qureshi on 6/2/14.
//
//

#import "CategoryCollectionViewCell.h"
#import "UtilitiesHelper.h"

@implementation CategoryCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setData:(ItemDetail*)feed{
    if ([feed.imageUrl length] != 0 && ![feed.imageUrl isKindOfClass: [NSNull class]]) {
          dispatch_async(dispatch_get_main_queue(), ^{
             [UtilitiesHelper addActivityIndicatorToView:_feedImage];
          });
          [self getImageView:_feedImage ItemDetail:feed];
        }
        else {
            NSLog(@"image is manual");
            NSLog(@"image name is %@",feed.imageName);
            if ([feed.imageName length] != 0 && ![feed.imageName isKindOfClass: [NSNull class]]){
                NSLog(@"image name is %@",feed.imageName);
                UIImage *image = [UIImage imageNamed:feed.imageName];
                _feedImage.image = image;
            }
        }
  
    
   
    
   // NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:feed.imageUrl];
  //  [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];
    
//    [_feedImage setImageWithURLRequest:request placeholderImage:[UIImage imageNamed:feed.placeholder] success:^(NSURLRequest * request, NSHTTPURLResponse * response, UIImage * image) {
//        [_feedImage setImage:image];
//        [UtilitiesHelper removeActivityIndicatorToView:_feedImage];
//
//    } failure:^(NSURLRequest * request, NSHTTPURLResponse * response, NSError * error) {
//
//        [UtilitiesHelper removeActivityIndicatorToView:_feedImage];
//
//    }];

}

- (void) getImageView:(UIImageView*)imageView ItemDetail:(ItemDetail*)item
{
   dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                   ^{
                       dispatch_async(dispatch_get_main_queue(), ^{
                           UIImage *image = [[UIImage alloc] init];
                           image = [UIImage imageNamed:item.placeholder];
                           imageView.image = image;
                       
                       });
                       
                       NSURL *imageURL = [NSURL URLWithString:item.imageUrl];
                       NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                       
                      
                       
                       //This is your completion handler
                       dispatch_async(dispatch_get_main_queue(), ^{
                           //If self.image is atomic (not declared with nonatomic)
                           // you could have set it directly above
                           UIImage *image  = [UIImage imageWithData:imageData];
                           
                           if (image != nil) {
                              imageView.image = image;
                           }
                           [UtilitiesHelper removeActivityIndicatorToView:_feedImage];
                           //This needs to be set here now that the image is downloaded
                           // and you are back on the main thread
                          
                           
                       });
                   });
    
    //Any code placed outside of the block will likely
    // be executed before the block finishes.
}


@end
