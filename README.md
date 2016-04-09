# Ultimate-AdBlock for Safari
Ad + Tracker (Content) Blocker for iOS & OSX written in Swift, using the new Content Blocker API for fast blocking.
Blocks hostnames and css items.

The project is in active development. Basic blocking is working fine but the filters.json needs a couple of more filters before it is a good replacement for the popular existing ones.

## Filters
Ultimate AdBlock uses a couple of filters;

#### Hostnames
- [pgl.yoyo.org Adserver hostnames](https://pgl.yoyo.org/adservers/)
- Custom hostnames

#### CSS Element Hiding
- [Fanboys Social Blocklist (Section: General Element Hiding Rules)](https://easylist-downloads.adblockplus.org/fanboy-social.txt)
- Custom Anti AdBlock CSS elements
- Custom Ads CSS elements
- Custom Social sharing CSS elements
- Javascript files

All block data is stored in .txt files. Some have different formats. For example the pgl.yoyo adservers are all on one line, seperated with a ,.
The malwaredomainlist.txt has a different format; 127.0.0.1 examplehost.com. The update-filters.swift script removes the 127.0.0.1 part so all that remains are the hosts, seperated with a ,.
The custom-hostnames.txt is also different. Every host is stored on a new line, for clarity.

By default all filters are enabled. If you want to disable a filter (for example the social css elements) you can do so by setting the correct variable in update-filters.swift to false.
Run the script again to generate fresh filters.

#### Number of filters (as of 9 April 2016)

-- Hostnames:
yoyo pgl adserver hostnames: 2423
Malware Domains: 0
Custom hostnames: 64

-- CSS Elements Hiding & JavaScripts:
CSS Elements (Custom) - Ads: 62
CSS Elements (Custom) - Social: 21
CSS Elements (Custom) - Anti AdBlock: 6
CSS Elements - Social Fanboys List: 6705
Javascript files: 27

## ToDo

- malwaredomainlist filters
- privacy trackers filter
- converting easylists to this new format
- OSX extension
- iOS Interface to enable/disable filters

## How to install

- Download the project
- Build the project on your device
- On your device go to Settings -> Safari -> Content Blockers -> Enable 
- Enjoy a cleaner web with no annoying ads and trackers!

This Content Blocking API is only available on 64 bit devices (iPhone 5s and newer, iPad Air and newer)

## How to update the filters

Updating the blocking filters is easy:

- Update the filters in the folder BlockData
- CD TO /path/to/update-filters.swift in your terminal.
- Run script: /usr/bin/swift update-filters.swift

filters.json in the AdBlockerExtension is now updated. Open the app on your device to load the new filters into Safari.

## Contribute

If you want to contribute to this project please consider opening an issue of a pull request!

## About the Safari Content Blocker API

For more info about this awesome API please check;

- [https://developer.apple.com/videos/play/wwdc2015/511/](https://developer.apple.com/videos/play/wwdc2015/511/) - WWDC 2015 session
- [https://webkit.org/blog/3476/content-blockers-first-look/](https://webkit.org/blog/3476/content-blockers-first-look/) - Introduction to WebKit Content Blockers, First Look

## License
The MIT License (MIT)

Copyright (c) 2016 Eric Horstmanshof

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.