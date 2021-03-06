//
//  AKTrakt.swift
//  Pods
//
//  Created by Florian Morello on 30/10/15.
//
//

import Foundation

public extension NSHTTPURLResponse {
    var shouldRetry: Bool {
        return statusCode == 504 || statusCode == 503
    }
}

public extension String {
    var slug:String {
        var cp = self.lowercaseString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        // remove accents
        cp = cp.stringByFoldingWithOptions(NSStringCompareOptions.DiacriticInsensitiveSearch, locale: NSLocale.currentLocale())
        cp = cp.stringByReplacingOccurrencesOfString(" ", withString: "-", options: NSStringCompareOptions.LiteralSearch, range: nil)
        cp = cp.stringByReplacingOccurrencesOfString("'", withString: "-", options: NSStringCompareOptions.LiteralSearch, range: nil)
        return cp
    }
}

public func delay(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}