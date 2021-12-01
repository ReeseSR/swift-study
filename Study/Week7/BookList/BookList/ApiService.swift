//
//  ApiService.swift
//  BookList
//
//  Created by 배소린 on 2021/12/01.
//

import Foundation

class ApiService {
    
    private var dataTask: URLSessionDataTask?
    
    func fetchBookData(completion: @escaping(Result<BooksData, Error>) -> Void) {
        //  specify the location of where we getting the data from
        let bookListURL = "https://booklist-25f6c-default-rtdb.firebaseio.com/data.json"
        
        guard let url = URL(string: bookListURL) else { return }
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            do {
                // JSON -> Book 으로 decode
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(BooksData.self, from: data!)
                
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
                
                
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
}
