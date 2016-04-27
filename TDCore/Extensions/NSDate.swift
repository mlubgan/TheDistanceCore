//
//  NSDate.swift
//  TheDistanceCore
//
//  Created by Josh Campion on 30/10/2015.
//  Copyright © 2015 The Distance. All rights reserved.
//

import Foundation

/**
 
 Convenience function for comparing two `NSDate` objects.
 
 - note: `compareDate(_:toDate:toUnitGranularity:)` should be used for more complex comparing.

 - returns: `true` if `d1.compare(d2)` returns `.OrderedDescending`.
*/
public func >(d1:NSDate, d2:NSDate) -> Bool {
    return d1.compare(d2) == .OrderedDescending
}

/**
 
 Convenience function for comparing two `NSDate` objects.
 
 - note: `compareDate(_:toDate:toUnitGranularity:)` should be used for more complex comparing.
 
 - returns: `true` if `d1.compare(d2)` returns `.OrderedAscending`.
 */
public func <(d1:NSDate, d2:NSDate) -> Bool {
    return d1.compare(d2) == .OrderedAscending
}

/**
 
 Convenience function for comparing two `NSDate` objects.
 
 - note: `compareDate(_:toDate:toUnitGranularity:)` should be used for more complex comparing.
 
 - returns: `true` if `d1.compare(d2)` is not `.OrderedAscending`.
 */

public func >=(d1:NSDate, d2:NSDate) -> Bool {
    return d1.compare(d2) != .OrderedAscending
}

/**
 
 Convenience function for comparing two `NSDate` objects.
 
 - note: `compareDate(_:toDate:toUnitGranularity:)` should be used for more complex comparing.
 
 - returns: `true` if `d1.compare(d2)` is not `.OrderedDescending`.
 */

public func <=(d1:NSDate, d2:NSDate) -> Bool {
    return d1.compare(d2) != .OrderedDescending
}

/**
 
 Convenience function for comparing two `NSDate` objects. `isEqual(_:)` on `NSDate` is overriden to use this method.
 
 - note: `compareDate(_:toDate:toUnitGranularity:)` should be used for more complex comparing.
 
 - returns: `true` if `d1.compare(d2)` is `.OrderedSame`.
 */
public func ==(d1:NSDate, d2:NSDate) -> Bool {
    return d1.compare(d2) == .OrderedSame
}

public extension NSDate {
    
    /// Override of default implementation of `isEqual(_:)` to use `==` comparison of `NSDate`s, which checks the result of `compare(_:)` to be `.OrderedSame`. This gives `NSDate` value semantics.
    override public func isEqual(object: AnyObject?) -> Bool {
    
        guard let other = object as? NSDate else {
            return false
        }
        
        return self == other
    }
}