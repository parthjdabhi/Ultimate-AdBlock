//
//  FirstViewController.swift
//  Ultimate AdBlock
//
//  Created by Eric Horstmanshof on 25-11-15.
//  Copyright © 2015 Arrow Webprojects. All rights reserved.
//

import UIKit
import SafariServices
import Foundation

class SetupVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = NSLocalizedString("NAVBAR_SETUP", comment: "")

        /// Reload the Blocker List on starting the app.
        let identifier = "com.arrowwebprojects.Ultimate-AdBlock.AdBlockerExtension"
        SFContentBlockerManager.reloadContentBlockerWithIdentifier(identifier) { (error) -> Void in
            print(error)
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

