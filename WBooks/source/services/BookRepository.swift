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

final class TokenManager {
    private var token: String = ""
    
    static var shared: TokenManager = {
        let instance = TokenManager()
        return instance
    }()
    
    private init() {}
    
    func setToken(_ token: String) {
        self.token = token
    }
    
    func getToken() -> String {
        return token
    }
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
    
    func deleteBook(_ id: String, onError: @escaping (String) -> Void, onSuccess: @escaping () -> Void)
}

final class BookRepository: BookRepositoryType {
    func saveBook(_ body: BookRequest,
                  onError: @escaping (Error) -> Void,
                  onSuccess: @escaping (Book) -> Void) {
        
        let header = HTTPHeaders(arrayLiteral: HTTPHeader.authorization(TokenManager.shared.getToken()))
        AF.request(Endpoint.books, method: .post, parameters: body,
                   encoder: JSONParameterEncoder.default, headers: header)
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
    
    func deleteBook(_ id: String, onError: @escaping (String) -> Void, onSuccess: @escaping () -> Void) {
        let header = HTTPHeaders(arrayLiteral: HTTPHeader.authorization(TokenManager.shared.getToken()))
        let endpoint = Endpoint.deleteBook + id
        AF.request(endpoint, method: .delete, headers: header)
            .validate()
            .responseDecodable(of: GeneralResponse.self) { response in
                switch response.result {
                case .success:
                    onSuccess()
                case .failure(let error):
                    onError(error.localizedDescription)
                }
            }
    }
}

