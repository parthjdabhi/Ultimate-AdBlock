//
//  update-filters.swift
//  Ultimate AdBlock
//
//  Created by Eric Horstmanshof on 29-11-15.
//  Copyright © 2015 Arrow Webprojects. All rights reserved.
//

import Foundation

/// update-filters.swift file to update the adblocking filters used by the application.
/// There is an already available hosts list available and you can add custom ones.
///
///

/// HOWTO: Update the filters
///
/// CD TO /path/to/update-filters.swift
/// RUN AS: /usr/bin/swift update-filters.swift
/// filters.json in the AdBlockerExtension is now updated.

var filters = [[String:[String:String]]]()

// MARK: FILTER: Default yoyo adservers

/// pgl.yoyo adservers
/// !!!
/// All credit for these hostnames: https://pgl.yoyo.org/adservers/
/// !!!
var adServerHostnames = [String]()

do {
    
    let contents = try NSString(contentsOfFile: "BlockData/yoyo-adservers.txt", usedEncoding: nil) as String
    
    if contents.characters.count > 0 {
        
        adServerHostnames = contents.componentsSeparatedByString(",")
        
    }
    
} catch {
    print("Can't read the yoyo-adservers.txt file.")
}

// MARK: FILTER: Malwaredomains
/// MalwareDomains
/// !!!
/// All credit for these hostnames:
/// !!!
var malwareHostnames = [String]()

do {
    
    let contents = try NSString(contentsOfFile: "BlockData/malwaredomainlist.txt", usedEncoding: nil) as String
    
    if contents.characters.count > 0 {
    
        let hosts = contents.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
        
        for host in hosts {
            malwareHostnames.append(host.substringFromIndex(host.startIndex.advancedBy(10)))
        }
        
    }
    
} catch {
    print("Can't read the malwaredomainlist.txt file.")
}

// MARK: FILTER: Custom Hostnames
/// Custom hostnames to block
var customHostnames = [String]()

do {
    
    let contents = try NSString(contentsOfFile: "BlockData/custom-hostnames.txt", usedEncoding: nil) as String
    
    if contents.characters.count > 0 {
        
        customHostnames = contents.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
    
    }
    
} catch {
    print("Can't read the custom-hostnames.txt file.")
}

// MARK: FILTER: Anti Adblock Elements
/// Remove Anti AdBlock elements
var antiAdBlockElements: String = ""

do {
    
    let contents = try NSString(contentsOfFile: "BlockData/anti-adblock.txt", usedEncoding: nil) as String
    
    if contents.characters.count > 0 {
        
        antiAdBlockElements = contents
    
    }
} catch {
    print("Can't read the anti-adblock.txt file.")
}

// MARK: FILTER: CSS Elements Ads
/// Remove CSS Elements for ads
var cssElementsAds: String = ""

do {
    
    let contents = try NSString(contentsOfFile: "BlockData/css-elements-ads.txt", usedEncoding: nil) as String
    
    if contents.characters.count > 0 {

        cssElementsAds = (contents as String).stringByReplacingOccurrencesOfString("\n", withString: ",")
        
    }
    
} catch {
    print("Can't read the css-elements-ads.txt file.")
}

// MARK: FILTER: CSS Element Social
/// Remove CSS Elements for social
var cssElementsSocial: String = ""

do {
    
    let contents = try NSString(contentsOfFile: "BlockData/css-elements-social.txt", usedEncoding: nil) as String
    
    if contents.characters.count > 0 {
    
        cssElementsSocial = (contents as String).stringByReplacingOccurrencesOfString("\n", withString: ",")
        
    }
    
} catch {
    print("Can't read the css-elements-social.txt file.")
}

// MARK: FILTER: CSS Elements Social Fanboy
/// Remove CSS Elements for social
/// !!!
/// All credit for this data: 
/// URL:
/// !!!

var cssElementsSocialFanboy: String = ""

do {
    
    let contents = try NSString(contentsOfFile: "BlockData/css-elements-social-fanboy.txt", usedEncoding: nil) as String
    
    if contents.characters.count > 0 {
        
        cssElementsSocialFanboy = (contents as String).stringByReplacingOccurrencesOfString("\n", withString: ",")
        
        cssElementsSocialFanboy = (cssElementsSocialFanboy as String).stringByReplacingOccurrencesOfString("###", withString: "#")
        
        cssElementsSocialFanboy = (cssElementsSocialFanboy as String).stringByReplacingOccurrencesOfString("##.", withString: ".")
        
    }
    
} catch {
    print("Can't read the css-elements-social-fanboy.txt file.")
}

// MARK: FILTER: Javascripts
/// Block the following javascripts
var javascriptElements = [String]()

do {
    
    let contents = try NSString(contentsOfFile: "BlockData/javascripts.txt", usedEncoding: nil) as String
    
    if contents.characters.count > 0 {
        
        javascriptElements = contents.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
        
    }
    
} catch {
    print("Can't read the javascripts.txt file.")
}

// MARK: Iterating over the filters and add them to the blockList array.

print("------------------")
print("Started generating the filters.json file.")
print("")
print("Default adserver hostnames: \(adServerHostnames.count)")
print("Malware Domains: \(malwareHostnames.count)")
print("Custom hostnames: \(customHostnames.count)")
print("")

/// Iterate over every hostname and add it to the block list.
for host in adServerHostnames {
    if host != "" {
        let block = ["trigger" : ["url-filter" : String(host) ], "action" : [ "type" : "block" ] ]
        filters.append(block)
    }
}

/// Iterate over every hostname and add it to the block list.
for host in malwareHostnames {
    if host != "" {
        let block = ["trigger" : ["url-filter" : String(host) ], "action" : [ "type" : "block" ] ]
        filters.append(block)
    }
}

// Iterate over every custom hostname and add it to the block list.
for customHost in customHostnames {
    if customHost != "" {
        if !adServerHostnames.contains(customHost) {
        
        let block = ["trigger" : ["url-filter" : String(customHost) ], "action" : [ "type" : "block" ] ]
            filters.append(block)
        } else {
            print("*********************")
            print("* WARNING: \(customHost) already exists in the default adserver hostname list.\n* This entry will be ignored. You can delete this custom hostname from the list.")
            print("*********************")
            print("")
        }
    }
}

/// Anti Adblock Elements
let antiAdBlockElementsBlock = ["trigger" : ["url-filter" : ".*" ], "action" : [ "type" : "css-display-none", "selector" : "\(antiAdBlockElements)" ] ]
filters.append(antiAdBlockElementsBlock)

/// Ads CSS Elements
let cssElementsAdsBlock = ["trigger" : ["url-filter" : ".*" ], "action" : [ "type" : "css-display-none", "selector" : "\(cssElementsAds)" ] ]
filters.append(cssElementsAdsBlock)

/// Social CSS Elements
let cssElementsSocialBlock = ["trigger" : ["url-filter" : ".*" ], "action" : [ "type" : "css-display-none", "selector" : "\(cssElementsSocial)" ] ]
filters.append(cssElementsSocialBlock)

/// Social CSS Elements Fanboy List
let cssElementsSocialFanboyBlock = ["trigger" : ["url-filter" : ".*" ], "action" : [ "type" : "css-display-none", "selector" : "\(cssElementsSocialFanboy)" ] ]
filters.append(cssElementsSocialFanboyBlock)

/// Javascripts
for javascriptElement in javascriptElements {
    let javascriptElementBlock = ["trigger" : ["url-filter" : "\(javascriptElement)" ], "action" : [ "type" : "block" ] ]
    filters.append(javascriptElementBlock)
}

// MARK: Generate json file.
/// Parse the JSON and write it to a file.

print("Generating filters.json file..")

let data = try! NSJSONSerialization.dataWithJSONObject(filters, options: NSJSONWritingOptions.PrettyPrinted)
let string = NSString(data: data, encoding: NSUTF8StringEncoding)

do {
    try string!.writeToFile("AdBlockerExtension/filters.json", atomically: false, encoding: NSUTF8StringEncoding)
}
catch {
    print("Extension Writing Error: \(error)")
}

print("All done! filters.json has been updated.")
print("Restart the app on the device to load the new filters.")
print("------------------")