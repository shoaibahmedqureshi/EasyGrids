//
//  CustomGridView.h
//
//
//  Created by Shoaib Ahmed Qureshi on 6/2/14.
//
//

#import <Foundation/Foundation.h>

@protocol CustomGridViewDelegate <NSObject>
@optional
-(void)didSelectRowAtIndexPath:(NSIndexPath*)indexPath object:(id)gridObject;
-(void)didDeselectRowAtIndexPath:(NSIndexPath*)indexPath object:(id)gridObject;
-(void)pageControlValue:(int)pageControlValue;
-(void)didSelectRowAtIndexPath:(NSIndexPath*)indexPath;
-(void)didDeselectRowAtIndexPath:(NSIndexPath*)indexPath;
-(void)cellSelected:(id)object;

@end

typedef enum{
    TRIPCELL,
    TRIPMEDIACELL,
    MEDIACELL,
}CellType;

typedef enum{
    SINGLE,
    MULTIPLE,
}CellSelectionType;

#import <UIKit/UIKit.h>

@interface CustomGridView :  UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,retain)NSMutableArray* arrayGridObjects;

@property(nonatomic,weak)id<CustomGridViewDelegate> customGridViewDelegate;

@property(nonatomic)UIEdgeInsets cellPadding;

@property(nonatomic) CGSize cellSize;

@property(nonatomic,retain) UIFont* fontTitle;

@property(nonatomic,retain) UIColor* colorTitleLabelBg;

@property(nonatomic,retain) UIColor* colorCellBorder;

@property(nonatomic,retain) UIColor* colorSelectedCellBorder;

@property(nonatomic,retain) UIColor* colorTitleLabelText;

@property(nonatomic) float  cellBorderWidth;

@property(nonatomic) float selectedCellBorderWidth;

@property(nonatomic,retain) NSString* nibName;

@property(nonatomic) BOOL isMediaCell;

@property(nonatomic) BOOL isDestinationCell;

@property(nonatomic) CellSelectionType cellSelectionType;

@property(nonatomic) CellType cellType;

- (id)initWithFrame:(CGRect)frame andScrollDirection:(UICollectionViewScrollDirection)scrollDirection selectionType:(CellSelectionType)selectionType;


-(void)reloadCustomGridViewData;

-(void)reloadGrid;

-(void)setMinimumLineSpacing:(CGFloat)minLineSpace andMinimumInteritemSpacing:(CGFloat)minInterItemSpacing andScrollDirection:(UICollectionViewScrollDirection)scrollDirection;

@end
