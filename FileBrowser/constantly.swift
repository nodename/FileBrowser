//
//  constantly.swift
//  FileBrowser
//
//  Created by Alan Shaw on 2/18/20.
//

import Foundation

// a function that returns _value_ for any FBFile.
// used as default filter
func constantly(_ value: Bool) -> (FBFile) -> Bool {
    let f: (FBFile) -> Bool = { _ in
        return value
    }
    return f
}
