##The Promise of Swift and the Future of Objective-C

In last week's WWDC, Apple introduced an entirely new language for Mac and iOS development called Swift.  Swift is a modern language that is less verbose but is just as expressive as Objective-C.  Furthermore, Swift offers a number of features not available in Objective-C.  And while the news of this new language is exciting, it's also intimidating.  The introduction of Swift means that many long hours of work lay ahead.  For many experienced Objective-C developers, this realization may inspire some anxiety.  

Nonetheless, it's important to realize that Objective-C isn't going anywhere in the near term.  From working with legacy code and Apple's Foundation frameworks to understanding prominent development patterns in Mac and iOS, it still makes sense to be comfortable with Objective-C.  Developers will be encountering Objective-C in their daily work for some time to come.  To be sure, many of the lessons, tricks, and best-practices that were learned 

This post seeks to allay some of the anxiety that arises from the sea shift that Apple has recently introduced by providing some examples of how to use Objective-C with Swift.  I'll cover familiar callback mechanisms like delegation and notifications, and will also provide an example of using a custom UITableViewCell with a UITableViewController.  Overall, the post aims to demonstrate how we can begin to integrate Swift into our projects so that we can seamlessly modernize our development.

##Integrating Objective-C and Swift
