//
//  HomeViewModel.swift
//  WBooks
//
//  Created by noelia.nieres on 20/08/2021.
//

import Foundation

protocol HomeViewModelProtocol {
    func getBooks(onError: @escaping (String) -> Void, onSuccess: @escaping ([Book]) -> Void)
    func getCellViewModel(at indexPath: IndexPath)  -> Book
    func setBooks(_ valor: [Book])
    func getBooksList() -> [Book]
}

final class HomeViewModel: HomeViewModelProtocol {
    private let repository: BookRepositoryType
    
    var books: [Book] = []
    
    func setBooks(_ valor: [Book] ) {
        self.books = valor
    }
    
    func getBooksList() -> [Book] {
        return self.books
    }
    
    var numberOfCells: Int {
        return books.count
    }
    
    func getCellViewModel(at indexPath: IndexPath)  -> Book  {
        return books[indexPath.row]
    }

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
