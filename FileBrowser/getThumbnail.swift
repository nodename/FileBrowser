//
//  getThumbnail.swift
//  FileBrowser
//
//  Created by Alan Shaw on 2/19/20.
//  Copyright © 2020 Roy Marmelstein. All rights reserved.
//

import Foundation

func getThumbnail(for filePath: URL) -> UIImage? {
    guard let src = CGImageSourceCreateWithURL(filePath as CFURL, nil) else { return nil }
    let scale = UIScreen.main.scale
    let w = 75
    let d = [
        kCGImageSourceShouldAllowFloat : true,
        kCGImageSourceCreateThumbnailWithTransform : true,
        kCGImageSourceCreateThumbnailFromImageAlways : true,
        kCGImageSourceThumbnailMaxPixelSize : w
        ] as [CFString : Any]
    guard let imref = CGImageSourceCreateThumbnailAtIndex(src, 0, d as CFDictionary) else { return nil }
    let im = UIImage(cgImage: imref, scale: scale, orientation: .up)
    return im
}
