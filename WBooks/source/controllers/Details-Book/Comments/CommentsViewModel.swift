//
//  CommentsViewModel.swift
//  WBooks
//
//  Created by noelia.nieres on 19/08/2021.
//
import UIKit

protocol CommentsViewModelProtocol {
    func getBookComments(_ bookId: Int, onError: @escaping (String) -> Void, onSuccess: @escaping ([Comment]) -> Void)
    func getUser(_ id: String, onError: @escaping (String) -> Void, onSuccess: @escaping (User) -> Void)
    func getUserComment(_ comment: Int, onError: @escaping (String) -> Void, onSuccess: @escaping (User) -> Void)
    func setUsers(_ valor: User)
    func getUsers() -> [User]
}

final class CommentsViewModel: CommentsViewModelProtocol {
    private let repository: BookRepositoryType
    
    let userId = "2"
    var usuarios: [User] = []
    
    func setUsers(_ valor: User) {
        usuarios.append(valor)
    }
    
    func getUsers() -> [User] {
        return self.usuarios
    }
    
    init(repository: BookRepositoryType = BookRepository()) {
        self.repository = repository
    }
    
    func getBookComments(_ bookId: Int, onError: @escaping (String) -> Void, onSuccess: @escaping ([Comment]) -> Void){
        repository.getBookComments(bookId) { errorMessage in
            onError(errorMessage)
        } onSuccess: { comments in
            onSuccess(comments)
        }
    }
    
    func getUser(_ id: String, onError: @escaping (String) -> Void, onSuccess: @escaping (User) -> Void) {
        repository.getUser(userId) { errorMessage in
            onError(errorMessage)
        } onSuccess: { user in
            onSuccess(user)
        }
    }
    
    func getUserComment(_ comment: Int, onError: @escaping (String) -> Void, onSuccess: @escaping (User) -> Void) {
        repository.getUserComment(comment) { errorMessage in
            onError(errorMessage)
        } onSuccess: { user in
            onSuccess(user)
        }
    }
}
