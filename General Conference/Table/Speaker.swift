//
//  Speaker.swift
//  General Conference
//
//  Created by Misha Milovidov on 12/19/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import Foundation
import GRDB

struct Speaker : TableMapping, RowConvertible {
    
    // MARK: - Properties
    
    var id: Int
    var givenNames: String
    var lastNames: String
    var abbr: String
    var info: String
    var nameSort: String
    
    // MARK: - Table mapping
    
    static let databaseTableName = "speaker"
    
    // MARK: - Field names
    
    static let id = "ID"
    static let givenNames = "GivenNames"
    static let lastNames = "LastNames"
    static let abbr = "Abbr"
    static let info = "Info"
    static let nameSort = "NameSort"
    
    // MARK: - Initialization
    
    init() {
        id = 0
        givenNames = ""
        lastNames = ""
        abbr = ""
        info = ""
        nameSort = ""
    }
    
    init(row: Row) {
        id = row[Speaker.id]
        givenNames = row[Speaker.givenNames]
        lastNames = row[Speaker.lastNames]
        abbr = row[Speaker.abbr]
        info = row[Speaker.info]
        nameSort = row[Speaker.nameSort]
    }
}

