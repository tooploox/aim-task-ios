AIM task
===

This is a test task for All In Media.

Application loads radio station data from http://aim.appdata.abc.net.au.edgesuite.net/data/abc/triplej/onair.xml and presents it to the user.

There's a Swift version (branch: "Swift") and Objective-C (branch: "objC") but please note that I haven't written a single line of code in Obj-C in over three years.

# Structure

Just like Android app, iOS version follows Clean Architecture principles with three primary layers -- domain, data and presentation.


# Issues

- there's no error handling or empty views support
- there are no tests for gateway
- since there are no design requirements, application UI is really simple
- commits for Objective-C version are Swift ones + "Conversion WiP" because Swift version was rewritten as Objective-C and it was impossible to do this "file by file"
- just like in Android app, models contain more data than they have to (everything is parsed but just some of the properties make it to the UI)
