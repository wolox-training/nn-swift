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
    static let login = Endpoint.domain + "/auth"
    static let register = Endpoint.domain + "/register"
    static let books = Endpoint.domain + "/books"
    static let deleteBook = Endpoint.domain + "/books/"
}

struct GeneralResponse: Codable {
    let isDone: Bool
    let message: String
}

struct ErrorResponse: Codable {
    let error: String
}

struct BookRequest: Codable {
    let text: String
    let imageUrl: String?
    let videoUrl: String?
}

protocol BookRepositoryType {
    func saveBook(_ body: BookRequest,
                  onError: @escaping (Error) -> Void,
                  onSuccess: @escaping (Book) -> Void)
    
    func getBooks(onError: @escaping (String) -> Void, onSuccess: @escaping ([Book]) -> Void)
    
    func getComments(_ id: String, onError: @escaping (String) -> Void, onSuccess: @escaping ([Comment]) -> Void)
}

final class BookRepository: BookRepositoryType {
    func saveBook(_ body: BookRequest,
                  onError: @escaping (Error) -> Void,
                  onSuccess: @escaping (Book) -> Void) {
        
        AF.request(Endpoint.books, method: .post, parameters: body,
                   encoder: JSONParameterEncoder.default, headers: nil)
            .validate()
            .responseDecodable(of: Book.self) { response in
                switch response.result {
                case .success(let post):
                    onSuccess(post)
                case .failure(let error):
                    onError(error)
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
    

    func getComments(_ id: String, onError: @escaping (String) -> Void, onSuccess: @escaping ([Comment]) -> Void) {
    
        let ruta = Endpoint.books + "/\(id )/comments"
        print(ruta, " ruta")
        
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
}

