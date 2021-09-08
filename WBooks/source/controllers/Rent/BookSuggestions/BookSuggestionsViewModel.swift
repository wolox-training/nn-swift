//
//  RentedBooksViewModel.swift
//  WBooks
//
//  Created by noelia.nieres on 07/09/2021.
//

import UIKit

protocol BookSuggestionsViewModelProtocol {

    func getSuggestions(onError: @escaping (String) -> Void, onSuccess: @escaping ([Suggestion]) -> Void)
}

final class BookSuggestionsViewModel: BookSuggestionsViewModelProtocol {
    
    private let repository: BookRepositoryType
    
    init(repository: BookRepositoryType = BookRepository()) {
        self.repository = repository
    }
    
    func getSuggestions(onError: @escaping (String) -> Void, onSuccess: @escaping ([Suggestion]) -> Void) {
        repository.getSuggestions { errorMessage in
            onError(errorMessage)
        } onSuccess: { suggestions in
            onSuccess(suggestions)
        }
    }
}
