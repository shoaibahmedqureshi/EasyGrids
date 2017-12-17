//
//  CustomGridView.m
//
//
//  Created by Shoaib Ahmed Qureshi on 6/2/14.
//
//
#define APPC_IS_IPAD        (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad) ? YES : NO
#define CellIdentifier @"CategoryCell"

#import "CustomGridView.h"
#import "CategoryCollectionViewCell.h"


@implementation CustomGridView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame andScrollDirection:(UICollectionViewScrollDirection)scrollDirection
{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    _nibName = @"CategoryCollectionViewCell";
    [layout setScrollDirection:scrollDirection];
    if(APPC_IS_IPAD){
        layout.minimumLineSpacing = 3.0f;
        layout.minimumInteritemSpacing=3.0f;
    }
    else{
        layout.minimumLineSpacing = 3.0f;
        layout.minimumInteritemSpacing=3.0f;
    }
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self setFrame:frame];
        [self setDataSource:self];
        [self setDelegate:self];
        //        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
        [self setShowsHorizontalScrollIndicator:NO];
    }
    
    return self;
}

-(void)setMinimumLineSpacing:(CGFloat)minLineSpace andMinimumInteritemSpacing:(CGFloat)minInterItemSpacing andScrollDirection:(UICollectionViewScrollDirection)scrollDirection
{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:scrollDirection];
    if(APPC_IS_IPAD){
        layout.minimumLineSpacing = minLineSpace*3;
        layout.minimumInteritemSpacing=minInterItemSpacing*3;
    }
    else{
        layout.minimumLineSpacing = minLineSpace;
        layout.minimumInteritemSpacing=minInterItemSpacing;
    }

    [self setCollectionViewLayout:layout];
}


-(void)reloadCustomGridViewData{
    
    [self reloadData];
}

-(void)reloadGrid {
     [self reloadData];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(0, 0);
}


- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return [self.arrayGridObjects count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *collectionViewCell;
        //NSBundle *bundle = [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:_nibName withExtension:@"bundle"]];
         NSString* const frameworkBundleID  =  @"com.shoaib.EasyCollections.EasyGrids";
         NSBundle* bundle = [NSBundle bundleWithIdentifier:frameworkBundleID];

        [collectionView registerClass:[CategoryCollectionViewCell class]
           forCellWithReuseIdentifier:CellIdentifier];
        [collectionView registerNib:[UINib nibWithNibName:_nibName bundle:bundle] forCellWithReuseIdentifier:CellIdentifier];
        //
        CategoryCollectionViewCell *cell = (CategoryCollectionViewCell *)[collectionView
                                                                                dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
        
//        GridEntity* gridDataObject=[self.arrayGridObjects objectAtIndex:indexPath.row];
//
        [cell setData:[self.arrayGridObjects objectAtIndex:indexPath.row]];
//    [cell performSelector:@selector(setData:) withObject:[self.arrayGridObjects objectAtIndex:indexPath.row] afterDelay:0.01];
    
        collectionViewCell=cell;
    
    
    UILongPressGestureRecognizer* gesture=[[UILongPressGestureRecognizer alloc]init];
    [gesture setMinimumPressDuration:0.5];
    [gesture addTarget:self action:@selector(longGesturePressed:)];
    [collectionViewCell addGestureRecognizer:gesture];
    
    return collectionViewCell;
}

-(void)longGesturePressed:(UILongPressGestureRecognizer*)gesture{
//    if(gesture.state==UIGestureRecognizerStateBegan){
//        if([self.customGridViewDelegate respondsToSelector:@selector(cellSelected:)])
//            if([[SignInModel signIn] userType]==IS_USER)
//                [self.customGridViewDelegate cellSelected:gesture.view];
//    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return _cellPadding;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return _cellSize;
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//    CGFloat pageWidth = self.frame.size.width;
//    int pageControlValue = self.contentOffset.x / pageWidth;
//    
//    if([self.customGridViewDelegate respondsToSelector:@selector(pageControlValue:)])
//        [self.customGridViewDelegate pageControlValue:pageControlValue];
    
}

/*- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.frame.size.width;
    int pageControlValue = self.contentOffset.x / pageWidth;
    
    if([self.customGridViewDelegate respondsToSelector:@selector(pageControlValue:)])
        [self.customGridViewDelegate pageControlValue:pageControlValue];
    
}*/



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if([self.customGridViewDelegate respondsToSelector:@selector(didSelectRowAtIndexPath:)])
        [self.customGridViewDelegate didSelectRowAtIndexPath:indexPath];
    
    if([self.customGridViewDelegate respondsToSelector:@selector(didSelectRowAtIndexPath:object:)])
        [self.customGridViewDelegate didSelectRowAtIndexPath:indexPath object:self];
}


@end
