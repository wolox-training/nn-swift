//
//  WishViewModel.swift
//  WBooks
//
//  Created by noelia.nieres on 10/09/2021.
//
import Foundation

protocol WishViewModelProtocol {
    func getWishes(onError: @escaping (String) -> Void, onSuccess: @escaping ([Wish]) -> Void)
}

final class WishViewModel: WishViewModelProtocol {
    private let repository: BookRepositoryType
    
    var books: [Book] = []
    let userId = "2"

    init(repository: BookRepositoryType = BookRepository()) {
        self.repository = repository
    }
    
    func getWishes(onError: @escaping (String) -> Void, onSuccess: @escaping ([Wish]) -> Void){
        repository.getWishes(userId) { errorMessage in
            onError(errorMessage)
        } onSuccess: { wishes in
            onSuccess(wishes)
        }
    }
}

