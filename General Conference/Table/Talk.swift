//
//  Talk.swift
//  General Talk
//
//  Created by Misha Milovidov on 12/19/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import Foundation
import GRDB

struct Talk : TableMapping, RowConvertible {
    
    // MARK: - Properties
    
    var id: Int
    var corpus: String
    var url: String
    var title: String
    var date: String
    var speakerId: Int
    var listenUrl: String
    var watchUrl: String
    
    // MARK: - Table mapping
    
    static let databaseTableName = "talk"
    
    // MARK: - Field names
    
    static let id = "ID"
    static let corpus = "Corpus"
    static let url = "URL"
    static let title = "Title"
    static let date = "Date"
    static let speakerId = "SpeakerID"
    static let listenUrl = "ListenURL"
    static let watchUrl = "WatchURL"
    
    // MARK: - Initialization
    
    init() {
        id = 0
        corpus = ""
        url = ""
        title = ""
        date = ""
        speakerId = 0
        listenUrl = ""
        watchUrl = ""
    }
    
    init(row: Row) {
        id = row[Talk.id]
        corpus = row[Talk.corpus]
        url = row[Talk.url]
        title = row[Talk.title]
        date = row[Talk.date]
        speakerId = row[Talk.speakerId]
        listenUrl = row[Talk.listenUrl]
        watchUrl = row[Talk.watchUrl]
    }
}
