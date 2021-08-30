//
//  HomeViewModel.swift
//  WBooks
//
//  Created by noelia.nieres on 20/08/2021.
//

import Foundation

protocol HomeViewModelProtocol {
    func getBooks(onError: @escaping (String) -> Void, onSuccess: @escaping ([Book]) -> Void)
 
}

final class HomeViewModel: HomeViewModelProtocol {
    private let repository: BookRepositoryType

    init(repository: BookRepositoryType = BookRepository()) {
        self.repository = repository
    }
    
    
    func getBooks(onError: @escaping (String) -> Void, onSuccess: @escaping ([Book]) -> Void) {
        repository.getBooks { errorMessage in
            onError(errorMessage)
        } onSuccess: { books in
            onSuccess(books)
        }
    }

}
