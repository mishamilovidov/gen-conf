//
//  ConferenceTalk.swift
//  General Conference
//
//  Created by Misha Milovidov on 12/19/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import Foundation
import GRDB

struct ConferenceTalk : TableMapping, RowConvertible {
    
    // MARK: - Properties
    
    var talkId: Int
    var sessionId: Int
    var startPageNum: Int
    var endPageNum: Int
    var sequence: Int
    
    // MARK: - Table mapping
    
    static let databaseTableName = "conference_talk"
    
    // MARK: - Field names
    
    static let talkId = "TalkID"
    static let sessionId = "SessionID"
    static let startPageNum = "StartPageNum"
    static let endPageNum = "EndPageNum"
    static let sequence = "Sequence"
    
    // MARK: - Initialization
    
    init() {
        talkId = 0
        sessionId = 0
        startPageNum = 0
        endPageNum = 0
        sequence = 0
    }
    
    init(row: Row) {
        talkId = row[ConferenceTalk.talkId]
        sessionId = row[ConferenceTalk.sessionId]
        startPageNum = row[ConferenceTalk.startPageNum]
        endPageNum = row[ConferenceTalk.endPageNum]
        sequence = row[ConferenceTalk.sequence]
    }
}
