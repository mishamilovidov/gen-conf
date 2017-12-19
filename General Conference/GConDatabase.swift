//
//  GConDatabase.swift
//  General Conference
//
//  Created by Misha Milovidov on 12/19/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import Foundation
import GRDB

class GConDatabase {
    
    // MARK: - Constants
    
    struct Constant {
        static let fileName = "core.23"
        static let fileExtension = "sqlite"
    }
    
    // MARK: - Properties
    
    var dbQueue: DatabaseQueue!
    
    // MARK: - Singleton
    
    static let sharedGeoDatabase = GConDatabase()
    
    fileprivate init() {
        // This guarantees that code outside this file can't instantiate a GeoDatabase.
        // So others must use the sharedGeoDatabase singleton.
        dbQueue = try? DatabaseQueue(path: Bundle.main.path(forResource: Constant.fileName,
                                                            ofType: Constant.fileExtension)!)
    }
    
    // MARK: - Helpers
}
