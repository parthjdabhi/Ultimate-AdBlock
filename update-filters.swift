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

/// CSS Elements Ads Easylist
let cssElementsAdsEasyListEnabled = true

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
let adServerHostnamesFile = "BlockData/yoyo-adservers.txt"

if adServerHostnamesEnabled == true {

    do {
        
        let contents = try NSString(contentsOfFile: adServerHostnamesFile, usedEncoding: nil) as String
        
        if contents.characters.count > 0 {
            
            adServerHostnames = contents.componentsSeparatedByString(",")
            
        }
        
    } catch {
        print("Can't read the \(adServerHostnamesFile) file.")
    }
    
}

// MARK: FILTER: Malwaredomainlist

/// MalwareDomainList
/// !!!
/// All credit for these hostnames:
/// !!!
var malwareHostnames = [String]()
let malwareHostnamesFile = "BlockData/malwaredomainlist.txt"

if malwareHostnamesEnabled == true {

    do {
        
        let contents = try NSString(contentsOfFile: malwareHostnamesFile, usedEncoding: nil) as String
        
        if contents.characters.count > 0 {
        
            let hosts = contents.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
            
            for host in hosts {
                malwareHostnames.append(host.substringFromIndex(host.startIndex.advancedBy(10)))
            }
            
        }
        
    } catch {
        print("Can't read the \(malwareHostnamesFile) file.")
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
let customHostnamesFile = "BlockData/custom-hostnames.txt"

if customHostnamesEnabled == true {

    do {
        
        let contents = try NSString(contentsOfFile: customHostnamesFile, usedEncoding: nil) as String
        
        if contents.characters.count > 0 {
            
            customHostnames = contents.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
        
        }
        
    } catch {
        print("Can't read the \(customHostnamesFile) file.")
    }

}
// MARK: FILTER: Anti Adblock Elements
/// Remove Anti AdBlock CSS elements
var antiAdBlockElements: String = ""
let antiAdBlockElementsFile = "BlockData/custom-css-elements-antiadblock.txt"

if antiAdBlockElementsEnabled == true {

    do {
        
        let contents = try NSString(contentsOfFile: antiAdBlockElementsFile, usedEncoding: nil) as String
        
        if contents.characters.count > 0 {
            
            antiAdBlockElements = (contents as String).stringByReplacingOccurrencesOfString("\n", withString: ",")
        
        }
    } catch {
        print("Can't read the \(antiAdBlockElementsFile) file.")
    }
    
}

// MARK: FILTER: CSS Elements Ads
/// Remove CSS Elements for ads
var cssElementsAds: String = ""
let cssElementsAdsFile = "BlockData/custom-css-elements-ads.txt"

if cssElementsAdsEnabled == true {

    do {
        
        let contents = try NSString(contentsOfFile: cssElementsAdsFile, usedEncoding: nil) as String
        
        if contents.characters.count > 0 {

            cssElementsAds = (contents as String).stringByReplacingOccurrencesOfString("\n", withString: ",")
            
        }
        
    } catch {
        print("Can't read the \(cssElementsAdsFile) file.")
    }
    
}

// MARK: FILTER: CSS Element Social
/// Remove CSS Elements for social buttons
var cssElementsSocial: String = ""
let cssElementsSocialFile = "BlockData/custom-css-elements-social.txt"

if cssElementsSocialEnabled == true {

    do {
        
        let contents = try NSString(contentsOfFile: cssElementsSocialFile, usedEncoding: nil) as String
        
        if contents.characters.count > 0 {
        
            cssElementsSocial = (contents as String).stringByReplacingOccurrencesOfString("\n", withString: ",")
            
        }
        
    } catch {
        print("Can't read the \(cssElementsSocialFile) file.")
    }
    
}

// MARK: FILTER: CSS Elements Social Fanboy
/// Remove CSS Elements for social buttons
/// !!!
/// All credit for this data: https://easylist-downloads.adblockplus.org/fanboy-social.txt
/// Section: General element hiding rules
/// URL:
/// !!!

var cssElementsSocialFanboy: String = ""
let cssElementsSocialFanboyFile = "BlockData/fanboys-social-blocking-list.txt"

if cssElementsSocialFanboyEnabled == true {

    do {
        
        let contents = try NSString(contentsOfFile: cssElementsSocialFanboyFile, usedEncoding: nil) as String
        
        if contents.characters.count > 0 {
            
            cssElementsSocialFanboy = (contents as String).stringByReplacingOccurrencesOfString("\n", withString: ",")
            cssElementsSocialFanboy = (cssElementsSocialFanboy as String).stringByReplacingOccurrencesOfString("###", withString: "#")
            cssElementsSocialFanboy = (cssElementsSocialFanboy as String).stringByReplacingOccurrencesOfString("##.", withString: ".")
            
        }
        
    } catch {
        print("Can't read the \(cssElementsSocialFanboyFile) file.")
    }
    
}

// MARK: FILTER: CSS Elements Easylist
/// Remove CSS Elements for ads
/// !!!
/// All credit for this data: https://easylist-downloads.adblockplus.org/easylist.txt
/// Section: General element hiding rules
/// URL:
/// !!!

var cssElementsAdsEasyList: String = ""
let cssElementsAdsEasyListFile = "BlockData/css-elements-ads-easylist.txt"

if cssElementsAdsEasyListEnabled == true {
    
    do {
        
        let contents = try NSString(contentsOfFile: cssElementsAdsEasyListFile, usedEncoding: nil) as String
        
        if contents.characters.count > 0 {
            
            cssElementsAdsEasyList = (contents as String).stringByReplacingOccurrencesOfString("\n", withString: ",")
            cssElementsAdsEasyList = (cssElementsAdsEasyList as String).stringByReplacingOccurrencesOfString("###", withString: "#")
            cssElementsAdsEasyList = (cssElementsAdsEasyList as String).stringByReplacingOccurrencesOfString("##.", withString: ".")
            
        }
        
    } catch {
        print("Can't read the \(cssElementsAdsEasyListFile) file.")
    }
    
}

// MARK: FILTER: Javascripts
/// Block the following javascripts
var javascriptElements = [String]()
let javascriptElementsFile = "BlockData/javascripts.txt"

if javascriptElementsEnabled == true {

    do {
        
        let contents = try NSString(contentsOfFile: javascriptElementsFile, usedEncoding: nil) as String
        
        if contents.characters.count > 0 {
            
            javascriptElements = contents.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
            
        }
        
    } catch {
        print("Can't read the \(javascriptElementsFile) file.")
    }
    
}

/// Statistics
let cssElementsAdsCount = cssElementsAds.componentsSeparatedByString(",").count
let cssElementsAdsEasyListCount = cssElementsAdsEasyList.componentsSeparatedByString(",").count
let cssElementsSocialCount = cssElementsSocial.componentsSeparatedByString(",").count
let antiAdBlockElementsCount = antiAdBlockElements.componentsSeparatedByString(",").count
let cssElementsSocialFanboyCount = cssElementsSocialFanboy.componentsSeparatedByString(",").count

// MARK: Iterating over the filters and add them to the blockList array.

var numberFormatter = NSNumberFormatter()
numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle

print("------------------")
print("Started generating the filters.json file.")
print("")
print("-- Hostnames:")
print("yoyo.pgl.org AdServer hostnames: \(numberFormatter.stringFromNumber(adServerHostnames.count)!)")
print("Malwaredomainlist: \(numberFormatter.stringFromNumber(malwareHostnames.count)!)")
print("Custom hostnames: \(numberFormatter.stringFromNumber(customHostnames.count)!)")
print("")
print("-- CSS Elements Hiding & JavaScripts:")
print("CSS Elements (Custom) - Ads: \(numberFormatter.stringFromNumber(cssElementsAdsCount)!)")
print("CSS Elements (Custom) - Social: \(numberFormatter.stringFromNumber(cssElementsSocialCount)!)")
print("CSS Elements (Custom) - Anti AdBlock: \(numberFormatter.stringFromNumber(antiAdBlockElementsCount)!)")
print("CSS Elements - Ads EasyList: \(numberFormatter.stringFromNumber(cssElementsAdsEasyListCount)!)")
print("CSS Elements - Social Fanboys List: \(numberFormatter.stringFromNumber(cssElementsSocialFanboyCount)!)")
print("Javascript files: \(numberFormatter.stringFromNumber(javascriptElements.count)!)")
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

/// Iterate over every custom hostname and add it to the block list.
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

/// Ads CSS Elements EasyList
let cssElementsAdsEasyListBlock = ["trigger" : ["url-filter" : ".*" ], "action" : [ "type" : "css-display-none", "selector" : "\(cssElementsAdsEasyList)" ] ]
filters.append(cssElementsAdsEasyListBlock)

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