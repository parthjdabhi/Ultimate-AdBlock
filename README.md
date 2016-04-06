# Ultimate-AdBlock
Ad + Tracker (Content) Blocker for iOS & OSX written in Swift, using the new Content Blocker API for fast blocking.
Blocks hostnames and css items.

### Filters
Ultimate AdBlock uses a couple of filters;

- [https://pgl.yoyo.org/adservers/](https://pgl.yoyo.org/adservers/)
- Custom hostnames

All block data is stored in .txt files. Some have different formats. For example the pgl.yoyo adservers are all on one line, seperated with a ,.
The malwaredomainlist.txt has a different format; 127.0.0.1 examplehost.com. The update-filters.swift script removes the 127.0.0.1 part so all that remains are the hosts, seperated with a ,.
The custom-hostnames.txt is also different. Every host is stored on a new line, for clarity.

### ToDo

- malwaredomainlist filters
- privacy trackers filter
- converting easylists to this new format
- OSX extension
- iOS Interface to enable/disable filters

### How to install

- Download the project
- Build the project on your device
- On your device go to Settings -> Safari -> Content Blockers -> Enable 
- Enjoy a cleaner web with no annoying ads and trackers!

This Content Blocking API is only available on 64 bit devices (iPhone 5s and newer, iPad Air and newer)

### How to update the filters

Updating the blocking filters is easy:

- Update the filters in the folder BlockData
- CD TO /path/to/update-filters.swift in your terminal.
- Run script: /usr/bin/swift update-filters.swift

filters.json in the AdBlockerExtension is now updated. Open the app on your device to load the new filters into Safari.

### Contribute

If you want to contribute to this project please consider opening an issue of a pull request!

### About the Safari Content Blocker API

For more info about this awesome API please check;

- [https://developer.apple.com/videos/play/wwdc2015/511/](https://developer.apple.com/videos/play/wwdc2015/511/) - WWDC 2015 session