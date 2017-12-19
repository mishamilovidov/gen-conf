//
//  ConferenceTalksViewController.swift
//  General Conference
//
//  Created by Misha Milovidov on 12/19/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import UIKit

class ConferenceTalksViewController : UITableViewController {
    
    // MARK: - Constants
    
    public struct Storyboard {
        static let TalkCellIdentifier = "TalkCell"
        static let TalkSegueIdentifier = "Show Talk"
    }
    
    // MARK: - Properties
    
    var talks: [Talk]!
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.TalkSegueIdentifier {
            if let destVC = segue.destination as? TalkViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    destVC.talk = GConDatabase.sharedGeoDatabase.talkForTalkId(talks[indexPath.row].id)
                    destVC.title = talks[indexPath.row].title
                }
            }
        }
    }
    
    // MARK: - Data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.TalkCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = talks[indexPath.row].title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return talks.count
    }
    
    // MARK: - Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Storyboard.TalkSegueIdentifier, sender: self)
    }
    
}
