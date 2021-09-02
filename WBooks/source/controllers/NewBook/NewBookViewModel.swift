//
//  NewBookViewModel.swift
//  WBooks
//
//  Created by noelia.nieres on 01/09/2021.
//

import UIKit

protocol NewBookViewModelProtocol {

}

final class NewBookViewModel: NewBookViewModelProtocol {
    private let repository: BookRepositoryType
    
    init(repository: BookRepositoryType = BookRepository()) {
        self.repository = repository
    }
    
   /* func getBookComments(_ bookId: Int, onError: @escaping (String) -> Void, onSuccess: @escaping ([Comment]) -> Void){
        repository.getBookComments(bookId) { errorMessage in
            onError(errorMessage)
        } onSuccess: { comments in
            onSuccess(comments)
        }
    }*/
    

}

