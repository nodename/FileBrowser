//
//  FileParser.swift
//  FileBrowser
//
//  Created by Roy Marmelstein on 13/02/2016.
//  Copyright © 2016 Roy Marmelstein. All rights reserved.
//

import Foundation

class FileParser {
    
    static let sharedInstance = FileParser()
    
    var _excludesFileExtensions = [String]()
    
    /// Mapped for case insensitivity
    var excludesFileExtensions: [String]? {
        get {
            return _excludesFileExtensions.map({$0.lowercased()})
        }
        set {
            if let newValue = newValue {
                _excludesFileExtensions = newValue
            }
        }
    }
    
    var filter: (FBFile) -> Bool = constantly(true)
    
    var excludesFilepaths: [URL]?
    
    let fileManager = FileManager.default
    
    func documentsURL() -> URL {
        return fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0] as URL
    }
        
    func filesForDirectory(_ directoryPath: URL) -> [FBFile]  {
        var files = [FBFile]()
        var filePaths = [URL]()
        // Get contents
        do  {
            filePaths = try self.fileManager.contentsOfDirectory(at: directoryPath, includingPropertiesForKeys: [], options: [.skipsHiddenFiles])
        } catch {
            return files
        }
        // Parse
        for filePath in filePaths {
            let file = FBFile(filePath: filePath)
            if let excludesFileExtensions = excludesFileExtensions, let fileExtension = file.fileExtension, excludesFileExtensions.contains(fileExtension) {
                continue
            }
            if let excludesFilepaths = excludesFilepaths , excludesFilepaths.contains(file.filePath) {
                continue
            }
            if file.displayName.isEmpty == false {
                files.append(file)
            }
        }
        files = files.filter(filter)
        // Sort
        files = files.sorted(){$0.displayName < $1.displayName}
        return files
    }

}
