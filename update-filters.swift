//
//  update-filters.swift
//  Ultimate AdBlock
//
//  Created by Eric Horstmanshof on 29-11-15.
//  Copyright © 2015 Arrow Webprojects. All rights reserved.
//

import Foundation

/// update-filter.swift file to update the adblocking filters used by the application.
/// There is an already available hosts list available and you can add custom ones.
///
///

/// HOWTO: Update the filters
///
/// CD TO /path/to/update-filters.swift
/// RUN AS: /usr/bin/swift update-filters.swift
/// filters.json in the AdBlockerExtension is now updated.

// MARK: Hostnames and CSS items to block

/// pgl.yoyo adservers
/// !!!
/// All credit for these hostnames: https://pgl.yoyo.org/adservers/
/// !!!
var adServerHostnames = [String]()

do {
    let contents = try NSString(contentsOfFile: "BlockData/yoyo-adservers.txt", usedEncoding: nil) as String
    let hosts = contents.componentsSeparatedByString(",")
    
    adServerHostnames = hosts
} catch {
    print("Can't read the yoyo-adservers.txt file.")
}

/// MalwareDomains
/// !!!
/// All credit for these hostnames:
/// !!!
var malwareHostnames = [String]()

do {
    let contents = try NSString(contentsOfFile: "BlockData/malwaredomainlist.txt", usedEncoding: nil) as String
    let hosts = contents.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
    
    for host in hosts {
        malwareHostnames.append(host.substringFromIndex(host.startIndex.advancedBy(10)))
    }
} catch {
    print("Can't read the malwaredomainlist.txt file.")
}

/// Custom hostnames to block
var customHostnames = [String]()

do {
    let contents = try NSString(contentsOfFile: "BlockData/custom-hostnames.txt", usedEncoding: nil) as String
    let hosts = contents.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
    
    customHostnames = hosts
} catch {
    print("Can't read the custom-hostnames.txt file.")
}

/// Remove Anti AdBlock items
var antiAdBlockItems: String = ""

do {
    let contents = try NSString(contentsOfFile: "BlockData/anti-adblock.txt", usedEncoding: nil) as String
    antiAdBlockItems = contents
} catch {
    print("Can't read the anti-adblock.txt file.")
}

/// Block CSS classes
let cssClasses: String = ".ad,.milq-partner,.mobileBanner,.social,.share,.ad-container,.socials,.newsletter,.funbox,.advert,.advert-wrap,.m-ad,.m-article__share-buttons,.inlinead,.sharedaddy,.fipoba,.social-media,.media-ad.section-ad,.tg-footer-header__social-buttons-wrap,.article-sharing-footer,.social-links,.landing-sprite-ordot,.landing-sprite-fb,.lgi-footertop-extra,.content-container-leaderboard,.dump-soc,.xl-help,.social-bar,.billboard_wrapper,.bnnr,.advertoriallist,.socialbuttons,.socialbar"

/// Block the following CSS Ids
let cssIds: String = "#b_ac,#b_re,#newsletter,#huckster-desktop-wrapper,#huckster-mobile-square-wrapper,#sponsored,#div-gpt-ad,#adTop_mobile,#adUnder_mobile,#adUnder2_mobile,#adUnder_Comment_mobile, #sideAd,#contentAd,#contentAdTwo,#adf-billboard,#sponsor,#sponsor-mobile,#chorus-social-fixed,#idOfElementWeShouldDisplayTheAdsIn, #bva320x50container,#radarPage_banner,#social,#adsenseAlternativeTop,#addThisChartContainerRain,#ad-row,#socialmedia_box"

/// Block the following CSS UL items
let cssUls: String = "ul.socials,ul.social-badges"

/// Block the following CSS P items
let cssPs: String = "p.social,p.socials,p.ad-container"

/// Block the following CSS aside items
let cssAsides: String = "aside.mashsb-container, aside.mashsb-main"

/// Block the following CSS section items
let cssSections: String = "section[id=site-ads]"

/// Block the following CSS ins items
let cssIns: String = "ins.adsbygoogle"

/// Block the following CSS li items
let cssLi: String = "li.news__type--promo, li.test"

/// Block the following CSS Meta items
let cssMeta: String = "meta[name=apple-itunes-app]"

/// Block the following javascripts
let javascriptsToBlock: String = "chartbeat\\.js,beacon\\.js,beacon.min\\.js,alllinksclicktracker\\.js,atrk\\.js,dtrack\\.js,gatracking\\.js,gpt\\.js,kissmetrics\\.js,omniture\\.js,sitecatalyst\\.js,twitter\\.com/widgets\\.js,usertracking_script\\.js,tracker\\.js,adsbygoogle\\.js,webtrekk_v3\\.js,plusone\\.js,widgets\\.js,advertising\\.js,call-me-now-popup.min\\.js,survey\\.js,tapatalkdetect\\.js,ads\\.js,socialmedia\\.js,usabilla\\.js"

/// Complete filters array
var filters = [[String:[String:String]]]()
        
// Arrays of block items.
let cssClassArray = cssClasses.componentsSeparatedByString(",")
let cssIdArray = cssIds.componentsSeparatedByString(",")
let cssUlArray = cssUls.componentsSeparatedByString(",")
let cssPArray = cssPs.componentsSeparatedByString(",")
let cssAsideArray = cssAsides.componentsSeparatedByString(",")
let cssSectionArray = cssSections.componentsSeparatedByString(",")
let cssInsArray = cssIns.componentsSeparatedByString(",")
let cssLiArray = cssLi.componentsSeparatedByString(",")
let cssMetaArray = cssMeta.componentsSeparatedByString(",")

let javascriptsArray = javascriptsToBlock.componentsSeparatedByString(",")

// MARK: Iterating over the filters and add them to the blockList array.

print("------------------")
print("Started generating the filters.json file.")
print("")
print("Default adserver hostnames: \(adServerHostnames.count)")
print("Malware Domains: \(malwareHostnames.count)")
print("Custom hostnames: \(customHostnames.count)")
print("CSS Classes: \(cssClassArray.count)")
print("CSS Ids: \(cssIdArray.count)")
print("Javascripts: \(javascriptsArray.count)")
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

/// Anti Adblock items
let blockAntiAdsCSS = ["trigger" : ["url-filter" : ".*" ], "action" : [ "type" : "css-display-none", "selector" : "\(antiAdBlockItems)" ] ]
filters.append(blockAntiAdsCSS)

let blockJsonCSS = ["trigger" : ["url-filter" : ".*" ], "action" : [ "type" : "css-display-none", "selector" : "\(cssClasses)" ] ]
filters.append(blockJsonCSS)

let blockJsonIds = ["trigger" : ["url-filter" : ".*" ], "action" : [ "type" : "css-display-none", "selector" : "\(cssIds)" ] ]
filters.append(blockJsonIds)

let blockLiCss = ["trigger" : ["url-filter" : ".*" ], "action" : [ "type" : "css-display-none", "selector" : "\(cssLi)" ] ]
filters.append(blockLiCss)

let blockAsidesCss = ["trigger" : ["url-filter" : ".*" ], "action" : [ "type" : "css-display-none", "selector" : "\(cssAsides)" ] ]
filters.append(blockAsidesCss)

let blockUlCss = ["trigger" : ["url-filter" : ".*" ], "action" : [ "type" : "css-display-none", "selector" : "\(cssUls)" ] ]
filters.append(blockUlCss)

let blockPCss = ["trigger" : ["url-filter" : ".*" ], "action" : [ "type" : "css-display-none", "selector" : "\(cssPs)" ] ]
filters.append(blockPCss)

let blockSectionCss = ["trigger" : ["url-filter" : ".*" ], "action" : [ "type" : "css-display-none", "selector" : "\(cssSections)" ] ]
filters.append(blockSectionCss)

let blockInsCss = ["trigger" : ["url-filter" : ".*" ], "action" : [ "type" : "css-display-none", "selector" : "\(cssIns)" ] ]
filters.append(blockInsCss)

let blockMetaCss = ["trigger" : ["url-filter" : ".*" ], "action" : [ "type" : "css-display-none", "selector" : "\(cssMeta)" ] ]
filters.append(blockMetaCss)

/*
// Loop over every css div ul and add it to the block list.
for cssUl in cssUlArray {
    if cssUl != "" {
        let block = ["trigger" : ["url-filter" : ".*" ], "action" : [ "type" : "css-display-none", "selector" : "ul.\(cssUl)" ] ]
        //blocks.append(block)
    }
}
 */

/*
// Loop over every css div p and add it to the block list.
for cssP in cssPArray {
    if cssP != "" {
        let block = ["trigger" : ["url-filter" : ".*" ], "action" : [ "type" : "css-display-none", "selector" : "p.\(cssP)" ] ]
        //blocks.append(block)
    }
}
 */

/*
// Loop over every css div aside and add it to the block list.
for cssAside in cssAsideArray {
    if cssAside != "" {
        let block = ["trigger" : ["url-filter" : ".*" ], "action" : [ "type" : "css-display-none", "selector" : "aside.\(cssAside)" ] ]
        ///blocks.append(block)
    }
}
 */

/*
// Loop over every css div section and add it to the block list.
for cssSection in cssSectionArray {
    if cssSection != "" {
        let block = ["trigger" : ["url-filter" : ".*" ], "action" : [ "type" : "css-display-none", "selector" : "section[id=\(cssSection)]" ] ]
        //blocks.append(block)
    }
}
 */

/*
// Loop over every css div ins and add it to the block list.
for cssin in cssInsArray {
    if cssin != "" {
        let block = ["trigger" : ["url-filter" : ".*" ], "action" : [ "type" : "css-display-none", "selector" : "ins.\(cssin)" ] ]
        //blocks.append(block)
    }
}
 */

/*
for cssLi in cssLiArray {
    if cssLi != "" {
        let block = ["trigger" : ["url-filter" : ".*" ], "action" : [ "type" : "css-display-none", "selector" : "li.\(cssLi)" ] ]
        //filters.append(block)
    }
}
 */

// Loop over every javascript and add it to the block list.
for javascript in javascriptsArray {
    if javascript != "" {
        let block = ["trigger" : ["url-filter" : String(javascript) ], "action" : [ "type" : "block" ] ]
       filters.append(block)
    }
}

print("Generating filters.json file..")

// MARK: Generate json file.
// Parse the JSON and write it to a file.
let data = try! NSJSONSerialization.dataWithJSONObject(filters, options: NSJSONWritingOptions.PrettyPrinted)
let string = NSString(data: data, encoding: NSUTF8StringEncoding)

do {
    try string!.writeToFile("AdBlockerExtension/filters.json", atomically: false, encoding: NSUTF8StringEncoding)
}
catch {
    print("Extension Writing Error: \(error)")
}

/*
do {
    try string!.writeToFile("Ultimate Adblock/filters.json", atomically: false, encoding: NSUTF8StringEncoding)
}
catch {
    print("Writing Error: \(error)")
}
 */

print("All done! filters.json has been updated.")
print("Restart the app on the device to load the new filters.")
print("------------------")
