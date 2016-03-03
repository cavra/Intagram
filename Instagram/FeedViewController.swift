//
//  FeedViewController.swift
//  Instagram
//
//  Created by Cory Avra on 2/29/16.
//  Copyright © 2016 coryavra. All rights reserved.
//

import UIKit
import Parse

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    // Outlets 
    @IBOutlet weak var tableView: UITableView!
    
    // Variables
    var media: [Post]?
    var refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initiate tableview
        tableView.dataSource = self
        tableView.delegate = self

        // Set up the refresh control
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: "refreshParseData:", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView?.addSubview(refreshControl)
        
        fetchDataFromParse()
        
        // Refresh to show the asynchronously loaded photos
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "refreshCells:", name:"photoUploaded", object: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        // Reload to reset the cell's selected states
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //Maximum of 20 cells per
        if (self.media?.count <= 20) {
            return self.media?.count ?? 0
        } else {
            return 20
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Content Cell", forIndexPath: indexPath) as! ContentCell
        
        cell.media = self.media?[indexPath.section]
        return cell
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  cell = tableView.dequeueReusableCellWithIdentifier("Header Cell") as! HeaderCell
        
        cell.media = self.media?[section]
        cell.backgroundColor =  UIColor(red:72/255,green:141/255,blue:200/255,alpha:0.9)
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45.0
    }
    
    func fetchDataFromParse() {
    
        // Construct PFQuery
        let query = PFQuery(className: "UserMedia")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // Fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (media: [PFObject]?, error: NSError?) -> Void in
            if (media != nil) {
                self.media = Post.postsWithArray(media!)
                self.tableView.reloadData()
            } else {
                print(error?.localizedDescription)
            }
        }
        
        // Tell refresh control it can stop showing up now
        if self.refreshControl.refreshing
        {
            self.refreshControl.endRefreshing()
        }
        
        self.tableView.reloadData()
    }
    
    func refreshCells(notification: NSNotification){
        tableView.reloadData()
    }
    
    func refreshParseData(sender:AnyObject) {
        self.fetchDataFromParse()
    }

}
