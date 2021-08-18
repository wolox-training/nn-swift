//
//  CommentsViewController.swift
//  WBooks
//
//  Created by noelia.nieres on 18/08/2021.
//

import UIKit

class CommentsViewController: UIViewController {
    
    private let commentView = CommentsView()
    
    let titles = ["A Little Bird Told Me", "When the Doves Disappeared", "The Best Book in the World", "Be Creative", "Redesign the Web" ]
    
    let subTitles = ["Timothy Cross fdsf", "Sofi Oksanen fsfsdf fwefw wtrte wfrewfw", "Peter Sjernstrom", "Tony Alcazar","Liliana Castilla"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()

    }
    private func setupTable(){
        commentView.delegate = self
        commentView.dataSource = self
        commentView.separatorStyle = .none
        commentView.showsVerticalScrollIndicator = false
        commentView.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9647058824, blue: 0.9803921569, alpha: 1)
        let nibName = UINib(nibName: "CommentsCellView", bundle: nil)
        commentView.register(nibName, forCellReuseIdentifier: "CommentsCellView")
        commentView.rowHeight = UITableView.automaticDimension
    }
}

extension CommentsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsCellView", for: indexPath) as! CommentsCellView
        cell.commonInit("img_book\(indexPath.item+1)", title: titles[indexPath.item], sub: subTitles[indexPath.item])
        return cell
    }
    
}
