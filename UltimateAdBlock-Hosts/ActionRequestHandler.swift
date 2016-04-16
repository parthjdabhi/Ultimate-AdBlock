//
//  ActionRequestHandler.swift
//  UltimateAdBlock-Hosts
//
//  Created by Eric Horstmanshof on 16-04-16.
//  Copyright © 2016 Arrow Webprojects. All rights reserved.
//

import UIKit
import MobileCoreServices

class ActionRequestHandler: NSObject, NSExtensionRequestHandling {

    func beginRequestWithExtensionContext(context: NSExtensionContext) {
        let attachment = NSItemProvider(contentsOfURL: NSBundle.mainBundle().URLForResource("blockerList", withExtension: "json"))!
    
        let item = NSExtensionItem()
        item.attachments = [attachment]
    
        context.completeRequestReturningItems([item], completionHandler: nil);
    }
    
}
