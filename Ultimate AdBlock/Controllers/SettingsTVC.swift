//
//  SettingsTVC.swift
//  Ultimate AdBlock
//
//  Created by Eric Horstmanshof on 29-11-15.
//  Copyright © 2015 Arrow Webprojects. All rights reserved.
//

import UIKit

class SettingsTVC: UITableViewController {
    
    var rateAppCell: UITableViewCell = UITableViewCell()
    var aboutVersionCell: UITableViewCell = UITableViewCell()

    // MARK: - View Controller LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = NSLocalizedString("NAVBAR_SETTINGS", comment: "")
        
        /// TableView Cells.
        rateAppCell.textLabel?.text = NSLocalizedString("RATE_APP", comment: "Rate Application in the App Store.")
        aboutVersionCell.textLabel?.text = NSString(format: NSLocalizedString("APP_VERSION", comment: "The App Version."), NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"] as! String) as String
        
        rateAppCell.imageView?.image = UIImage(named: "Rate App")
        aboutVersionCell.imageView?.image = UIImage(named: "Information")
        
        rateAppCell.accessoryType = .DisclosureIndicator
        
        aboutVersionCell.userInteractionEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        switch(indexPath.section) {
            
        case 0:
            switch(indexPath.row) {
            case 0: return self.rateAppCell
            case 1: return self.aboutVersionCell
            default: fatalError()
            }
        default: fatalError()
        }

        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if (indexPath.section == 0) {
            
            if (indexPath.row == 0) {
                
                // TODO: Naar App Store sturen
                
            }
            
        }
    }

}
