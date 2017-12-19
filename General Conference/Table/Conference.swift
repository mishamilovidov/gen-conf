//
//  Conference.swift
//  General Conference
//
//  Created by Misha Milovidov on 12/19/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import Foundation
import GRDB

struct Conference : TableMapping, RowConvertible {
    
    // MARK: - Properties
    
    var id: Int
    var description: String
    var abbr: String
    var year: String
    var annual: String
    var issueDate: String
    
    // MARK: - Table mapping
    
    static let databaseTableName = "conference"
    
    // MARK: - Field names
    
    static let id = "ID"
    static let description = "Description"
    static let abbr = "Abbr"
    static let year = "Year"
    static let annual = "Annual"
    static let issueDate = "IssueDate"
    
    // MARK: - Initialization
    
    init() {
        id = 0
        description = ""
        abbr = ""
        year = ""
        annual = ""
        issueDate = ""
    }
    
    init(row: Row) {
        id = row[Conference.id]
        description = row[Conference.description]
        abbr = row[Conference.abbr]
        year = row[Conference.year]
        annual = row[Conference.annual]
        issueDate = row[Conference.issueDate]
    }
}

