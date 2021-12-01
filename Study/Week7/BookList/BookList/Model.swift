//
//  Model.swift
//  BookList
//
//  Created by 배소린 on 2021/12/01.
//

import Foundation

struct BooksData: Codable {
    let books: [Book]
    
}

struct Book: Codable {
    var author: String?
    var title: String?
    var description: String?
    var genre: String?
    var image: String?
    var isbn: String?
    var published: String?
    var publisher: String?
    
}
