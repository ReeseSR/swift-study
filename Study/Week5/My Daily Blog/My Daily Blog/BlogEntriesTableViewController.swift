//
//  BlogEntriesTableViewController.swift
//  My Daily Blog
//
//  Created by 배소린 on 2021/11/15.
//

import UIKit

class BlogEntriesTableViewController: UITableViewController {
    
    var blogEntries : [BlogEntry] = [];

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return blogEntries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = UITableViewCell();

        let blogEntry = blogEntries[indexPath.row];
        
        row.textLabel?.text = blogEntry.content
        return row
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let entryViewController = segue.destination as? BlogEntryViewController {
            entryViewController.entriesViewController = self;
            
        }
    }
}
