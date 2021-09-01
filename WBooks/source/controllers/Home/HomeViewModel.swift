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
 
}

final class HomeViewModel: HomeViewModelProtocol {
    private let repository: BookRepositoryType
    
    var books: [Book] = []
    
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
           self.books = books
            onSuccess(books)
        }
    }

}
