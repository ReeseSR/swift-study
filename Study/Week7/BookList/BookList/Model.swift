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
    var title: String?
    var author: String?
    var genre: String?
    var description: String?
    var isbn: String?
    var image: String?
    var published: String?
    var pusblisher: String?
    
}
