//
//  NewBookViewModel.swift
//  WBooks
//
//  Created by noelia.nieres on 01/09/2021.
//

import UIKit

protocol NewBookViewModelProtocol {
    func addBook (_ book: Book, onCompletion: @escaping (Result<Book, Error>) -> Void)
}

final class NewBookViewModel: NewBookViewModelProtocol {
    private let repository: BookRepositoryType
    
    init(repository: BookRepositoryType = BookRepository()) {
        self.repository = repository
    }
    
    func addBook (_ book: Book, onCompletion: @escaping (Result<Book, Error>) -> Void) {
        repository.addBook(book) { error in
            onCompletion(.failure(error))
        } onSuccess: { book in
            onCompletion(.success(book))
        }
    }
    

}

