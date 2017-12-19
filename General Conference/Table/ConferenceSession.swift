//
//  ConferenceSession.swift
//  General ConferenceSession
//
//  Created by Misha Milovidov on 12/19/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import Foundation
import GRDB

struct ConferenceSession : TableMapping, RowConvertible {
    
    // MARK: - Properties
    
    var id: Int
    var description: String
    var abbr: String
    var date: String
    var sequence: Int
    var conferenceId: Int
    
    // MARK: - Table mapping
    
    static let databaseTableName = "conf_session"
    
    // MARK: - Field names
    
    static let id = "ID"
    static let description = "Description"
    static let abbr = "Abbr"
    static let date = "Date"
    static let sequence = "Sequence"
    static let conferenceId = "ConferenceID"
    
    // MARK: - Initialization
    
    init() {
        id = 0
        description = ""
        abbr = ""
        date = ""
        sequence = 0
        conferenceId = 0
    }
    
    init(row: Row) {
        id = row[ConferenceSession.id]
        description = row[ConferenceSession.description]
        abbr = row[ConferenceSession.abbr]
        date = row[ConferenceSession.date]
        sequence = row[ConferenceSession.sequence]
        conferenceId = row[ConferenceSession.conferenceId]
    }
}

