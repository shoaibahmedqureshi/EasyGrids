# EasyGrids
This is a custom control to create photo collections or grids easy.

Written for Objective C and can be integrated in projects written in any version of swift.

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
    
    
    
    func setUpCollection(yPosition:CGFloat) {
        
        let frame = CGRect.init(x: self.view.frame.origin.x, y: yPosition, width: self.view.frame.size.width, height: self.view.frame.size.height-100)
        
        scroll direction could be '.vertical'or '.horizontal'
        
        galleryView = CustomGridView.init(frame: frame , andScrollDirection: .vertical)
        galleryView.backgroundColor = UIColor.clear
        galleryView!.customGridViewDelegate = self
        
        cell can load images from a url.
        let item = ItemDetail.init()
        item.itemId = "1"
        item.imageUrl = "https://image.flaticon.com/sprites/new_packs/145841-avatar-set.png"
        item.placeholder = "placeholder"

        cell can use static images in project.
        array.add(item1)
        let item2 = ItemDetail.init()
        item2.itemId = "3"
        item2.imageName = "fish"

        array.add(item2)
        cellRation property will define distance between different cells
        let cellRatio = (UIScreen.main.bounds.size.width-9)/3;
        
        galleryView.arrayGridObjects = array
        
        let cellSize = CGSize.init(width:cellRatio, height: cellRatio)
        galleryView.cellSize = cellSize
        
        galleryView.reloadGrid()
        self.view.addSubview(galleryView)
        galleryView.reloadGrid()
        
    }
