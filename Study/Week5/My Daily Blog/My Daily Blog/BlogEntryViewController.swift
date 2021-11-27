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
    
    var blogEntry: BlogEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if blogEntry == nil {
            // create entry
        } else {
            // fill info
            blogEntryTextView.text = blogEntry!.content
            if let dateToBeDisplayed = blogEntry!.date {
                datePicker.date = dateToBeDisplayed
            }
            
        }

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Make Entry
        if blogEntry == nil {
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                
                let blogEntry = BlogEntry(context: context);
                blogEntry.date = datePicker.date
                blogEntry.content = blogEntryTextView.text
            }
            
        }
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()  // CoreData에 저장함
    }

    @IBAction func onDelete(_ sender: Any) {
        if blogEntry != nil {
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                
                context.delete(blogEntry!)
                try? context.save()
            }
        }
        navigationController?.popViewController(animated: true)
    }
}
