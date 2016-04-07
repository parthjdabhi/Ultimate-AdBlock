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
/// Restart or run the app on your device to get the newest filters.

// MARK: Enabled/Disabled per filter

/// Default pgl.yoyo adservers
let adServerHostnamesEnabled = true

/// Malwaredomains
let malwareHostnamesEnabled = true

/// Custom hostnames
let customHostnamesEnabled = true

/// CSS Elements Anti AdBlock
let antiAdBlockElementsEnabled = true

/// CSS Elements Ads
let cssElementsAdsEnabled = true

/// CSS Elements Social
let cssElementsSocialEnabled = true

/// CSS Elements Social from the fanboy list
let cssElementsSocialFanboyEnabled = true

/// Javascript elements
let javascriptElementsEnabled = true

/// Complete filters block
var filters = [[String:[String:String]]]()

// MARK: FILTER: Default yoyo adservers

/// pgl.yoyo adservers
/// !!!
/// All credit for these hostnames: https://pgl.yoyo.org/adservers/
/// !!!
var adServerHostnames = [String]()

if adServerHostnamesEnabled == true {

    do {
        
        let contents = try NSString(contentsOfFile: "BlockData/yoyo-adservers.txt", usedEncoding: nil) as String
        
        if contents.characters.count > 0 {
            
            adServerHostnames = contents.componentsSeparatedByString(",")
            
        }
        
    } catch {
        print("Can't read the yoyo-adservers.txt file.")
    }
    
}

// MARK: FILTER: Malwaredomains

/// MalwareDomains
/// !!!
/// All credit for these hostnames:
/// !!!
var malwareHostnames = [String]()

if malwareHostnamesEnabled == true {

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
    
}

/*
// MARK: FILTER: Easy Privacy List
 
/// Easy Privacy hostnames 
/// !!!
/// All Credit to: 
/// URL:
/// !!!
var easyprivacyHostnames = [String]()

do {
    
    let contents = try NSString(contentsOfFile: "BlockData/easyprivacy.txt", usedEncoding: nil) as String
    
    if contents.characters.count > 0 {
        
        easyprivacyHostnames = contents.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
        
    }
    
} catch {
    print("Can't read the easyprivacy.txt file.")
}
*/

// MARK: FILTER: Custom Hostnames
/// Custom hostnames to block
var customHostnames = [String]()

if customHostnamesEnabled == true {

    do {
        
        let contents = try NSString(contentsOfFile: "BlockData/custom-hostnames.txt", usedEncoding: nil) as String
        
        if contents.characters.count > 0 {
            
            customHostnames = contents.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
        
        }
        
    } catch {
        print("Can't read the custom-hostnames.txt file.")
    }

}
// MARK: FILTER: Anti Adblock Elements
/// Remove Anti AdBlock elements
var antiAdBlockElements: String = ""

if antiAdBlockElementsEnabled == true {

    do {
        
        let contents = try NSString(contentsOfFile: "BlockData/css-elements-antiadblock.txt", usedEncoding: nil) as String
        
        if contents.characters.count > 0 {
            
            antiAdBlockElements = contents
        
        }
    } catch {
        print("Can't read the css-elements-antiadblock.txt file.")
    }
    
}

// MARK: FILTER: CSS Elements Ads
/// Remove CSS Elements for ads
var cssElementsAds: String = ""

if cssElementsAdsEnabled == true {

    do {
        
        let contents = try NSString(contentsOfFile: "BlockData/css-elements-ads.txt", usedEncoding: nil) as String
        
        if contents.characters.count > 0 {

            cssElementsAds = (contents as String).stringByReplacingOccurrencesOfString("\n", withString: ",")
            
        }
        
    } catch {
        print("Can't read the css-elements-ads.txt file.")
    }
    
}

// MARK: FILTER: CSS Element Social
/// Remove CSS Elements for social
var cssElementsSocial: String = ""

if cssElementsSocialEnabled == true {

    do {
        
        let contents = try NSString(contentsOfFile: "BlockData/css-elements-social.txt", usedEncoding: nil) as String
        
        if contents.characters.count > 0 {
        
            cssElementsSocial = (contents as String).stringByReplacingOccurrencesOfString("\n", withString: ",")
            
        }
        
    } catch {
        print("Can't read the css-elements-social.txt file.")
    }
    
}

// MARK: FILTER: CSS Elements Social Fanboy
/// Remove CSS Elements for social
/// !!!
/// All credit for this data: 
/// URL:
/// !!!

var cssElementsSocialFanboy: String = ""

if cssElementsSocialFanboyEnabled == true {

    do {
        
        let contents = try NSString(contentsOfFile: "BlockData/fanboys-social-blocking-list.txt", usedEncoding: nil) as String
        
        if contents.characters.count > 0 {
            
            cssElementsSocialFanboy = (contents as String).stringByReplacingOccurrencesOfString("\n", withString: ",")
            cssElementsSocialFanboy = (cssElementsSocialFanboy as String).stringByReplacingOccurrencesOfString("###", withString: "#")
            cssElementsSocialFanboy = (cssElementsSocialFanboy as String).stringByReplacingOccurrencesOfString("##.", withString: ".")
            
        }
        
    } catch {
        print("Can't read the fanboys-social-blocking-list.txt file.")
    }
    
}

// MARK: FILTER: Javascripts
/// Block the following javascripts
var javascriptElements = [String]()

if javascriptElementsEnabled == true {

    do {
        
        let contents = try NSString(contentsOfFile: "BlockData/javascripts.txt", usedEncoding: nil) as String
        
        if contents.characters.count > 0 {
            
            javascriptElements = contents.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
            
        }
        
    } catch {
        print("Can't read the javascripts.txt file.")
    }
    
}

/// Statistics
let cssElementsAdsCount = cssElementsAds.componentsSeparatedByString(",").count
let cssElementsSocialCount = cssElementsSocial.componentsSeparatedByString(",").count
let antiAdBlockElementsCount = antiAdBlockElements.componentsSeparatedByString(",").count
let cssElementsSocialFanboyCount = cssElementsSocialFanboy.componentsSeparatedByString(",").count

// MARK: Iterating over the filters and add them to the blockList array.

print("------------------")
print("Started generating the filters.json file.")
print("")
print("-- Hostnames:")
print("yoyo pgl adserver hostnames: \(adServerHostnames.count)")
print("Malware Domains: \(malwareHostnames.count)")
print("Custom hostnames: \(customHostnames.count)")
print("")
print("-- CSS Elements Hiding & JavaScripts:")
print("CSS Elements (Custom) - Ads: \(cssElementsAdsCount)")
print("CSS Elements (Custom) - Social: \(cssElementsSocialCount)")
print("CSS Elements (Custom) - Anti AdBlock: \(antiAdBlockElementsCount)")
print("CSS Elements - Social Fanboys List: \(cssElementsSocialFanboyCount)")
print("Javascript files: \(javascriptElements.count)")
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