//
//  MainCollectionViewController.swift
//  ImgurLight
//
//  Created by Dennis Örnberg on 02/04/16.
//  Copyright © 2016 Dennis Örnberg. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController, SearchDelegate {
    
    let reuseIdentifier = "cell"
    
    let cells = ["daft_punk", "kanye_west", "tame_impala", "joy_division", "the_smiths", "metallica", "tycho"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        edgesForExtendedLayout = UIRectEdge.None
        /*extendedLayoutIncludesOpaqueBars = false
        automaticallyAdjustsScrollViewInsets = false
        collectionView?.contentInset.top = 20*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        // Info.plist was changed to make this work.
        return UIStatusBarStyle.LightContent
    }

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showInfo" {
            
            let controller = segue.destinationViewController as! ImageInfoViewController
            let imageCell = sender as! ImageCell
            
            controller.image = imageCell.imageView.image
            controller.text = imageCell.filename
            
        } else if segue.identifier == "search" {
            
            let navController = segue.destinationViewController as! UINavigationController
            let controller = navController.topViewController as! SearchViewController
            controller.delegate = self
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ImageCell
        
        let filename = cells[indexPath.row]
        cell.filename = filename
        cell.imageView.image = UIImage(named: filename)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let size = (UIScreen.mainScreen().bounds.size.width / 2.0) - 2
        return CGSize(width: size, height: size)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
    
    // MARK: SearchDelegate
    
    func changeTitle(title: String) {
        navigationItem.title = title
    }
}