//
//  NewBookViewModel.swift
//  WBooks
//
//  Created by noelia.nieres on 01/09/2021.
//

import UIKit

protocol NewBookViewModelProtocol {
    func addBook(book: BookRequest, onSuccess: @escaping (BookRequest) -> Void, onError: @escaping (String) -> Void)
}

final class NewBookViewModel: NewBookViewModelProtocol {
    private let repository: BookRepositoryType
    
    init(repository: BookRepositoryType = BookRepository()) {
        self.repository = repository
    }
 
    func addBook(book: BookRequest, onSuccess: @escaping (BookRequest) -> Void, onError: @escaping (String) -> Void) {
        repository.addBook(book: book) { bookRequest in
            onSuccess(bookRequest)
        } onError: { errorMessage in
            onError(errorMessage)
        }

    }
}
