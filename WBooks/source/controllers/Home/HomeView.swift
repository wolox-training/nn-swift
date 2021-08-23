//
//  HomeView.swift
//  WBooks
//
//  Created by noelia.nieres on 20/08/2021.
//

import UIKit

protocol HomeViewProtocol: UIView {
    var bookTable: UITableView { get }

}

final class HomeView: NibView {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var booksTable: UITableView!

}

extension HomeView: HomeViewProtocol {
    var bookTable: UITableView { booksTable }
    
}
