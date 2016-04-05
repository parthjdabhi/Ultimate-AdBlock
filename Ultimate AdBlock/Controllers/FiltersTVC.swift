//
//  FiltersTVC.swift
//  Ultimate AdBlock
//
//  Created by Eric Horstmanshof on 29-11-15.
//  Copyright © 2015 Arrow Webprojects. All rights reserved.
//

import UIKit

class FiltersTVC: UITableViewController {
    
    var adsCell: UITableViewCell = UITableViewCell()
    var trackersCell: UITableViewCell = UITableViewCell()
    var shareCell: UITableViewCell = UITableViewCell()
    
    struct Filter{
        var hostName: NSString
    }
    
    var tableViewItems = [Filter]()
    var filteredTableViewItems = [Filter]()

    // MARK: - View Controller LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = NSLocalizedString("NAVBAR_FILTERS", comment: "")
        
        adsCell.textLabel?.text = NSLocalizedString("FILTERS_ADS", comment: "")
        trackersCell.textLabel?.text = NSLocalizedString("FILTERS_TRACKERS", comment: "")
        shareCell.textLabel?.text = NSLocalizedString("FILTERS_SOCIAL_WIDGETS", comment: "")
        
        adsCell.accessoryType = .DisclosureIndicator
        trackersCell.accessoryType = .DisclosureIndicator
        shareCell.accessoryType = .DisclosureIndicator
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch (section) {
            
        case 0: return NSLocalizedString("TABLEVIEW_HEADER_TITLE_FILTERS_PREINSTALLED", comment: "")
        default: fatalError()
            
        }
        
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier("Filter", forIndexPath: indexPath)

        //cell.textLabel?.text = tableViewItems[indexPath.row].hostName as String

        //return cell
        
        switch(indexPath.section) {
            
        case 0:
            switch(indexPath.row) {
            case 0: return self.adsCell
            case 1: return self.trackersCell
            case 2: return self.shareCell
            default: fatalError()
            }
        default: fatalError()
        }
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if (indexPath.section == 0) {
            
            if (indexPath.row == 0) {
                
                self.performSegueWithIdentifier("Filters Ads", sender: self)
                
            }
            
            if (indexPath.row == 1) {
                
                self.performSegueWithIdentifier("Filters Trackers", sender: self)
                
            }
            
            if (indexPath.row == 2) {
                
                self.performSegueWithIdentifier("Filters Social", sender: self)
                
            }
            
        }
    }

}
