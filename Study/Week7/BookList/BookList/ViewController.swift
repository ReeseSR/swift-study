//
//  ViewController.swift
//  BookList
//
//  Created by 배소린 on 2021/12/01.
//

import UIKit

class ViewController: UIViewController {
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchBookData { books in
            for book in books {
                print(book.title!)
            }
            
        }
        
    }
    
    private var dataTask: URLSessionDataTask?
    
    func fetchBookData(completionHandler: @escaping([Book]) -> Void){
        //  specify the location of where we getting the data from
        let bookListURL = "https://booklist-25f6c-default-rtdb.firebaseio.com/data.json"
        
        guard let url = URL(string: bookListURL) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            do {
                // JSON -> Book 으로 decode
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Book].self, from: data!)
                
                completionHandler(jsonData)
                
            } catch {
                let error = error
                print(error.localizedDescription)
            }
        }
        dataTask.resume()
    }
    



}

