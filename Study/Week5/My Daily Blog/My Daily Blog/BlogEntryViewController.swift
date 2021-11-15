//
//  BlogEntryViewController.swift
//  My Daily Blog
//
//  Created by 배소린 on 2021/11/15.
//

import UIKit

class BlogEntryViewController: UIViewController {

    @IBOutlet weak var blogEntryTextView: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var entriesViewController: BlogEntriesTableViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Make Entry
        let blogEntry = BlogEntry();
        blogEntry.date = datePicker.date
        blogEntry.content =  blogEntryTextView.text
        
        // Add entry tableview array
        entriesViewController?.blogEntries.append(blogEntry);
        entriesViewController?.tableView.reloadData();
        
    }

}
