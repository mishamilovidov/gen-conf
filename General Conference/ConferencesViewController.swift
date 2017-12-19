//
//  ConferencesViewController.swift
//  General Conference
//
//  Created by Misha Milovidov on 12/19/17.
//  Copyright © 2017 Misha Milovidov. All rights reserved.
//

import UIKit

class ConferencesViewController : UITableViewController {
    
    // MARK: - Constants
    
    public struct Storyboard {
        static let ConferenceSegueIdentifier = "Show Talks"
        static let ConferenceCellIdentifier = "ConferenceCell"
    }
    
    // MARK: - Properties
    
    var conferences = GConDatabase.sharedGeoDatabase.conferences()
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.ConferenceSegueIdentifier {
            if let destVC = segue.destination as? ConferenceTalksViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    destVC.talks = GConDatabase.sharedGeoDatabase.talksForConferenceId(conferences[indexPath.row].id)
                    destVC.title = conferences[indexPath.row].description
                }
            }
        }
    }
    
    // MARK: - Data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.ConferenceCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = conferences[indexPath.row].description
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conferences.count
    }
}
