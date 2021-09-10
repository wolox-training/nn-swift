//
//  BookSuggestionsViewModel.swift
//  WBooks
//
//  Created by noelia.nieres on 07/09/2021.
//
import UIKit

protocol RentedBooksViewModelProtocol {
    
    func getBookRent(onError: @escaping (String) -> Void, onSuccess: @escaping ([Rent]) -> Void)
    func addBookRent(_ bookId: Int, onError: @escaping (String) -> Void, onSuccess: @escaping (Rent) -> Void)
}

final class RentedBooksViewModel: RentedBooksViewModelProtocol {
    private let repository: BookRepositoryType
    
    var userId = 2

    init(repository: BookRepositoryType = BookRepository()) {
        self.repository = repository
    }
    
    func getBookRent(onError: @escaping (String) -> Void, onSuccess: @escaping ([Rent]) -> Void) {
        repository.getBookRent(self.userId) { errorMessage in
            onError(errorMessage)
        } onSuccess: { books in
            onSuccess(books)
        }
    }
    
    func addBookRent(_ bookId: Int, onError: @escaping (String) -> Void, onSuccess: @escaping (Rent) -> Void){
        repository.addBookRent(bookId) { errorMessage in
            onError(errorMessage)
        } onSuccess: { rent in
            onSuccess(rent)
        }
    }
}
