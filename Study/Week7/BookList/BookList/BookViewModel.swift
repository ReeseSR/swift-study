//
//  BookViewModel.swift
//  BookList
//
//  Created by 배소린 on 2021/12/01.
//

import Foundation

class BookViewModel {
    private var apiSerive = ApiService()
    private var bookList = [Book]()
    
    func getBooksData(completion: @escaping() -> ()) {
        apiSerive.fetchBookData { [weak self] (result) in
            
            switch result {
            case .success(let listOf):
                self?.bookList = listOf.books
                completion()
            case .failure(let error):
                print("Error processing json data: \(error)")
            }
            
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if bookList.count != 0 {
            print(bookList.count)
            return bookList.count
        }
        return 0
    }
    
    func cellForRowAt (indexPath: IndexPath) -> Book {
        return bookList[indexPath.row]
    }
}
