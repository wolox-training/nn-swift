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
    static let suggestion = Endpoint.domain + "/suggestions"
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
    func getBookRent(_ userId: Int, onError: @escaping (String) -> Void, onSuccess: @escaping ([Rent]) -> Void)
    func getSuggestions(onError: @escaping (String) -> Void, onSuccess: @escaping ([Suggestion]) -> Void)
    func getWishes(_ id: String, onError: @escaping (String) -> Void, onSuccess: @escaping ([Wish]) -> Void)
    func addBookRent(_ bookId: Int, onError: @escaping (String) -> Void, onSuccess: @escaping (Rent) -> Void)
}

final class BookRepository: BookRepositoryType {
    
    var userId = 2
    
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
    func addBookRent(_ bookId: Int, onError: @escaping (String) -> Void, onSuccess: @escaping (Rent) -> Void) {
    
        let ruta = Endpoint.user + "/\(userId )/rents"
      
         let endpoint = URL(string: ruta)!
         var request = URLRequest(url: endpoint)
         request.addValue("application/json", forHTTPHeaderField: "Content-Type")
         request.addValue("application/json", forHTTPHeaderField: "Accept")
        var rentRequest: Rent!
        
        rentRequest = Rent(
            user_id: userId,
            book_id: bookId,
            from: Date.customDate(with: Date()),
            to: Date.customDate(with: Calendar.current.date(byAdding: .day, value: 1, to: Date())!)
        )
        
        AF.request(endpoint, method: .post, parameters: rentRequest, encoder: JSONParameterEncoder.default)
            .responseDecodable(of: Rent.self) { response in
            switch response.result {
                case .success(let rent):
                    onSuccess(rent)
                case .failure(let error):
                 onError(error.localizedDescription)
                }
        }
    }
    
    func getBookRent(_ userId: Int, onError: @escaping (String) -> Void, onSuccess: @escaping ([Rent]) -> Void) {
    
        let ruta = Endpoint.user + "/\(userId )/rents"
      
         let endpoint = URL(string: ruta)!
         var request = URLRequest(url: endpoint)
         request.addValue("application/json", forHTTPHeaderField: "Content-Type")
         request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        AF.request(endpoint, method: .get, headers: nil)
            .validate()
            .responseDecodable(of: [Rent].self) { response in
                switch response.result {
                case .success(let books):
                    onSuccess(books)
                case .failure(let error):
                    print(error)
                    onError(error.localizedDescription)
                }
            }
    }
    
    func getSuggestions(onError: @escaping (String) -> Void, onSuccess: @escaping ([Suggestion]) -> Void) {
        
        let endpoint = URL(string: Endpoint.suggestion)!
         var request = URLRequest(url: endpoint)
         request.addValue("application/json", forHTTPHeaderField: "Content-Type")
         request.addValue("application/json", forHTTPHeaderField: "Accept")

        AF.request(endpoint, method: .get, headers: nil)
            .validate()
            .responseDecodable(of: [Suggestion].self) { response in
                switch response.result {
                case .success(let suggestions):
                    print(suggestions, "suggestions")
                    onSuccess(suggestions)
                case .failure(let error):
                    onError(error.localizedDescription)
                }
            }
    }
    
    func getWishes(_ id: String, onError: @escaping (String) -> Void, onSuccess: @escaping ([Wish]) -> Void) {
    
        let ruta = Endpoint.user + "/\(id )/wishes"
        print(ruta, " ruta getWishes")
        
         let endpoint = URL(string: ruta)!
         var request = URLRequest(url: endpoint)
         request.addValue("application/json", forHTTPHeaderField: "Content-Type")
         request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        AF.request(endpoint, method: .get, headers: nil)
            .validate()
            .responseDecodable(of: [Wish].self) { response in
                switch response.result {
                case .success(let wishes):
                    onSuccess(wishes)
                case .failure(let error):
                    print(error)
                    onError(error.localizedDescription)
                }
            }
    }
}
