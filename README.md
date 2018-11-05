# EasyGrids
This is a custom control to create photo collections or grids easy.

Written for Objective C and can be integrated in projects written in any version swift above 2.0.

[![Platform](https://img.shields.io/cocoapods/p/GTToast.svg?style=flat)](https://swift.org)
[![Licence](https://img.shields.io/dub/l/vibe-d.svg?maxAge=2592000)](https://opensource.org/licenses/MIT)


## Requirements

* iOS 8.0+
* XCode 8.0+
* Swift 2.0+

## Screenshots

![](https://i.stack.imgur.com/lgXaN.png)

## Installation

#### Cocoa Pods
```
pod 'EasyGrids'
```
For Objective-C it can be integrated directly as it is written in Objective-C however Swift users need to implement bridge headers and write this #import <EasyGrids/EasyGrids.h> statement.

A quick example for swift users is https://github.com/shoaibahmedqureshi/EasyGridsExample

## Quick Guide

Just Integrate this control manually or through cocoapods and implement as below.
#### Swift
```Swift
class ViewController: UIViewController , CustomGridViewDelegate {
    
    var  galleryView : CustomGridView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollection(yPosition:50)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func didSelectRow(at indexPath: IndexPath!, object gridObject: Any!) {
        print("item clicked is \(gridObject)")
        
    }
   
    func didDeselectRow(at indexPath: IndexPath!, object gridObject: Any!) {
         print("item deselected is \(gridObject)")
    }
    
    
    
    func setUpCollection(yPosition:CGFloat) {
        
        let frame = CGRect.init(x: self.view.frame.origin.x, y: yPosition, width: self.view.frame.size.width, height: self.view.frame.size.height-50)
        //galleryView!.cellSelectionType = MULTIPLE
        galleryView = CustomGridView.init(frame: frame , andScrollDirection:.horizontal,selectionType :  MULTIPLE)
        galleryView.backgroundColor = UIColor.clear
        galleryView!.customGridViewDelegate = self


        galleryView!.selectedCellBorderWidth = 10.0
        galleryView!.colorSelectedCellBorder = UIColor.red
        galleryView!.cellBorderWidth = 2.0;
        galleryView!.colorCellBorder = UIColor.blue;
        
        let item = ItemDetail.init()
        item.itemId = "1"
        item.imageUrl = "https://image.flaticon.com/sprites/new_packs/145841-avatar-set.png"
        item.placeholder = "placeholder"
        
        
        let array = NSMutableArray.init()
        array.add(item)
        
        let item1 = ItemDetail.init()
        item1.itemId = "2"
        item1.imageUrl = "https://images.pexels.com/photos/67636/rose-blue-flower-rose-blooms-67636.jpeg"
        item1.placeholder = "placeholder"
        
        
        array.add(item1)
        let item2 = ItemDetail.init()
        item2.itemId = "3"
        item2.imageName = "fish"
        
        
        
        array.add(item2)
        array.add(item)
        array.add(item1)
        array.add(item2)
        array.add(item)
        array.add(item1)
        array.add(item2)
        array.add(item)
        array.add(item1)
        array.add(item2)
        array.add(item)
        array.add(item1)
        let cellRatio = (UIScreen.main.bounds.size.width-9)/3;
        galleryView.arrayGridObjects = array
        
        let cellSize = CGSize.init(width:cellRatio, height: cellRatio)
        galleryView.cellSize = cellSize
        
        galleryView.reloadGrid()
        self.view.addSubview(galleryView)
        galleryView.reloadGrid()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
```
#### Objective C
```Objective C
CGRect frame = CGRectMake(self.view.frame.origin.x, yPos, self.view.frame.size.width, self.view.frame.size.height - 100);

galleryView = [[CustomGridView alloc] initWithFrame:frame andScrollDirection:UICollectionViewScrollDirectionHorizontal selectionType:SINGLE];
galleryView.backgroundColor = [UIColor clearColor];
galleryView.customGridViewDelegate = self;

ItemDetail *item = [[ItemDetail alloc] init];
item.itemId = @"1";
item.imageUrl = @"https://image.flaticon.com/sprites/new_packs/145841-avatar-set.png";
item.placeholder = @"resize";

NSInteger totalItem = 20;
NSMutableArray *array = [NSMutableArray new];
for (NSInteger i = 0; i < totalItem; i++) {
[array addObject:item];
}
galleryView.arrayGridObjects = array;

CGFloat cellRatio = ([[UIScreen mainScreen] bounds].size.width - 9) / 3;
CGSize cellSize = CGSizeMake(cellRatio, cellRatio);
galleryView.cellSize = cellSize;

[self.view addSubview:galleryView];
[galleryView reloadGrid];
```
