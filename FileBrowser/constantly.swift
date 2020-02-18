//
//  constantly.swift
//  FileBrowser
//
//  Created by Alan Shaw on 2/18/20.
//  Copyright © 2020 Roy Marmelstein. All rights reserved.
//

import Foundation

func constantly(_ value: Any) -> (Any) -> Any {
    let f: (Any) -> Any = {_ in
        return value
    }
    return f
}
