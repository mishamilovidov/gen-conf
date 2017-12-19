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
        static let fileExtension = "db"
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
    
    //
    // Return array of Talk objects for the given conference session ID
    //
    func talksForConferenceId(_ sessionId: Int) -> [Talk] {
        do {
            let talks = try dbQueue.inDatabase { (db: Database) -> [Talk] in
                var talks = [Talk]()
                
                let rows = try Row.fetchCursor(db,
                                                "select * " +
                                                "from \(Talk.databaseTableName) t " +
                                                "join \(ConferenceTalk.databaseTableName) c " +
                                                "join \(ConferenceSession.databaseTableName) s " +
                                                "where t.\(Talk.id)=c.\(ConferenceTalk.talkId) " +
                                                "and c.\(ConferenceTalk.sessionId)=s.\(ConferenceSession.id) " +
                                                "and s.\(ConferenceSession.conferenceId) = ? " +
                                                "order by s.\(ConferenceSession.sequence), c.\(ConferenceTalk.sequence)",
                                                arguments: [ sessionId ])
                while let row = try rows.next() {
                    talks.append(Talk(row: row))
                }
                
                return talks
            }
            
            return talks
        } catch {
            return []
        }
    }
    
    //
    // Return talk object for a given talk ID
    //
    func talkForTalkId(_ talkId: Int) -> Talk? {
        do {
            let talk = try dbQueue.inDatabase { (db: Database) -> Talk in
                var talk = Talk()
                
                let rows = try Row.fetchCursor(db,
                                               "select * " +
                                                "from \(Talk.databaseTableName) t " +
                                                "where t.\(Talk.id) = ? ",
                                                arguments: [ talkId ])
                while let row = try rows.next() {
                    talk = (Talk(row: row))
                }
                return talk
            }
            
            return talk
        } catch {
            return nil
        }
    }
    
    //
    // Return a query that general a list of general conference talks ordered by issue date desc
    //
    func conferences() -> [Conference] {
        do {
            let conferences = try dbQueue.inDatabase { (db: Database) -> [Conference] in
                var conferences = [Conference]()
                
                for row in try Row.fetchAll(db,
                                            "select * " +
                                            "from \(Conference.databaseTableName) " +
                                            "order by \(Conference.issueDate) desc") {
                        conferences.append(Conference(row: row))
                }
                
                return conferences
            }
            
            return conferences
        } catch {
            return []
        }
    }
}
