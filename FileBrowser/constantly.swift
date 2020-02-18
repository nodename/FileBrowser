//
//  constantly.swift
//  FileBrowser
//
//  Created by Alan Shaw on 2/18/20.
//  Copyright © 2020 Roy Marmelstein. All rights reserved.
//

import Foundation

// a function that returns true for any FBFile.
// used as default filter
func constantly(_ value: Bool) -> (FBFile) -> Bool {
    let f: (FBFile) -> Bool = { _ in
        return value
    }
    return f
}
