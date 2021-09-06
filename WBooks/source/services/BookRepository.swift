//
//  BookApi.swift
//  WBooks
//
//  Created by noelia.nieres on 19/08/2021.
//

import Foundation
import Alamofire

struct Endpoint {
    static let domain = "https://ios-training-backend.herokuapp.com/api/v1"
    static let books = Endpoint.domain + "/books"
    static let user = Endpoint.domain + "/users/"
}

struct GeneralResponse: Codable {
    let isDone: Bool
    let message: String
}

struct ErrorResponse: Codable {
    let error: String
}

protocol BookRepositoryType {
    
    func addBook(book: BookRequest, onSuccess: @escaping (BookRequest) -> Void, onError: @escaping (String) -> Void)
    
    func getBooks(onError: @escaping (String) -> Void, onSuccess: @escaping ([Book]) -> Void)
    
    func getBookComments(_ bookId: Int, onError: @escaping (String) -> Void, onSuccess: @escaping ([Comment]) -> Void)
    
    func getUser(_ id: String, onError: @escaping (String) -> Void, onSuccess: @escaping (User) -> Void)
    
    func getUserComment(_ comment: Int, onError: @escaping (String) -> Void, onSuccess: @escaping (User) -> Void)
}

final class BookRepository: BookRepositoryType {
    
     func addBook(book: BookRequest, onSuccess: @escaping (BookRequest) -> Void, onError: @escaping (String) -> Void) {

        let endpoint = URL(string: Endpoint.books)!
        var request = URLRequest(url: endpoint)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

           AF.request(endpoint, method: .post, parameters: book, encoder: JSONParameterEncoder.default)
               .responseDecodable(of: BookRequest.self) { response in
               switch response.result {
                   case .success(let bookRequest):
                    print("book nuevo", bookRequest)
                       onSuccess(bookRequest)
                   case .failure(let error):
                    onError(error.localizedDescription)
                   }
           }
       }
    
    func getBooks(onError: @escaping (String) -> Void, onSuccess: @escaping ([Book]) -> Void) {
        
        let endpoint = URL(string: Endpoint.books)!
         var request = URLRequest(url: endpoint)
         request.addValue("application/json", forHTTPHeaderField: "Content-Type")
         request.addValue("application/json", forHTTPHeaderField: "Accept")

        AF.request(endpoint, method: .get, headers: nil)
            .validate()
            .responseDecodable(of: [Book].self) { response in
                switch response.result {
                case .success(let books):
                    onSuccess(books)
                case .failure(let error):
                    onError(error.localizedDescription)
                }
            }
    }
    

    func getBookComments(_ bookId: Int, onError: @escaping (String) -> Void, onSuccess: @escaping ([Comment]) -> Void) {
    
        let ruta = Endpoint.books + "/\(bookId )/comments"
      
         let endpoint = URL(string: ruta)!
         var request = URLRequest(url: endpoint)
         request.addValue("application/json", forHTTPHeaderField: "Content-Type")
         request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        AF.request(endpoint, method: .get, headers: nil)
            .validate()
            .responseDecodable(of: [Comment].self) { response in
                switch response.result {
                case .success(let comment):
                    onSuccess(comment)
                case .failure(let error):
                    print(error)
                    onError(error.localizedDescription)
                }
            }
    }
    
    func getUserComment(_ comment: Int, onError: @escaping (String) -> Void, onSuccess: @escaping (User) -> Void) {
    
        let ruta = Endpoint.user + "\(comment)"
    
         let endpoint = URL(string: ruta)!
         var request = URLRequest(url: endpoint)
         request.addValue("application/json", forHTTPHeaderField: "Content-Type")
         request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        AF.request(endpoint, method: .get, headers: nil)
            .validate()
            .responseDecodable(of: User.self) { response in
                switch response.result {
                case .success(let user):
                    //print(user, "usuario")
                    onSuccess(user)
                case .failure(let error):
                    print(error)
                    onError(error.localizedDescription)
                }
            }
    }
    
    func getUser(_ id: String, onError: @escaping (String) -> Void, onSuccess: @escaping (User) -> Void) {
    
        let ruta = Endpoint.user + "\(id )"
        print(ruta, " ruta getuser")
        
         let endpoint = URL(string: ruta)!
         var request = URLRequest(url: endpoint)
         request.addValue("application/json", forHTTPHeaderField: "Content-Type")
         request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        AF.request(endpoint, method: .get, headers: nil)
            .validate()
            .responseDecodable(of: User.self) { response in
                switch response.result {
                case .success(let user):
                    //print(user, "usuario")
                    onSuccess(user)
                case .failure(let error):
                    print(error)
                    onError(error.localizedDescription)
                }
            }
    }
}

