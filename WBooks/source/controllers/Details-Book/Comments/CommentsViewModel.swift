//
//  CommentsViewModel.swift
//  WBooks
//
//  Created by noelia.nieres on 19/08/2021.
//

import UIKit

protocol CommentsViewModelProtocol {
    func getComments(_ id: String, onError: @escaping (String) -> Void, onSuccess: @escaping ([Comment]) -> Void)
 
}

final class CommentsViewModel: CommentsViewModelProtocol {
    private let repository: BookRepositoryType

    init(repository: BookRepositoryType = BookRepository()) {
        self.repository = repository
    }
    
    func getComments(_ id: String, onError: @escaping (String) -> Void, onSuccess: @escaping ([Comment]) -> Void) {
        repository.getComments(id) { errorMessage in
            onError(errorMessage)
        } onSuccess: { comments in
            onSuccess(comments)
        }
    }
        

}
