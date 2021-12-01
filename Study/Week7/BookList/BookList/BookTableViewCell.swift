//
//  BookTableViewCell.swift
//  BookList
//
//  Created by 배소린 on 2021/12/01.
//

import UIKit

class BookTableViewCell: UITableViewCell {


    @IBOutlet weak var bookCover: UIImageView!
    
    @IBOutlet weak var bookTitle: UILabel!
    
    @IBOutlet weak var bookAuthor: UILabel!
    
    @IBOutlet weak var bookDescription: UILabel!
    
    
    private var urlString: String = ""
    func setCellWithValuesOf(_ book: Book){
        updateUIView(title: book.title, author: book.author, description: book.description, bookCover: book.image)
    }
    
    private func updateUIView(title: String?, author: String?, description: String?, bookCover: String?) {
        self.bookTitle.text = title
        self.bookAuthor.text = author
        self.bookDescription.text = description
        
        guard let coverString = bookCover else { return }
        urlString = coverString
        
        guard let coverImageURL = URL(string: urlString) else {
            self.bookCover.image = UIImage(named: "noImageAvailable");
            return
        }
        
        self.bookCover.image = nil
        
        getImageDataFrom(url: coverImageURL)
    }
    
    private func getImageDataFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("Empty Data")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.bookCover.image = image
                }
            }
            
        }.resume()
    }
}
