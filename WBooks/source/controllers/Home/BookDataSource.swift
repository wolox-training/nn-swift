//
//  BookDataSource.swift
//  WBooks
//
//  Created by noelia.nieres on 20/08/2021.
//

import UIKit

final class BookDataSource: NSObject {
    // MARK: - Private properties
    //private let userEmail = UserDefaults.standard.string(forKey: "email") ?? ""
    
    // MARK: Public properties
    //var books: [Book] = []
    
}

/*extension BookDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(books, "books")
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) 
        
        guard let bookCell = cell as? HomeCell,
              books.indices.contains(indexPath.row) else {
            return UITableViewCell()
        }
        print(bookCell, "bookCell")
        
        bookCell.configureWith(books[indexPath.row])
        return bookCell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = DetailsViewController("img_book\(indexPath.item+1)", titleBook: titles[indexPath.item])
        self.navigationController?.pushViewController(details, animated: true)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }*/
    
}*/
