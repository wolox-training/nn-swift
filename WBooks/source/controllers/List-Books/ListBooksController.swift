//
//  ListBooksController.swift
//  WBooks
//
//  Created by noelia.nieres on 09/08/2021.
//

import UIKit

struct System {
    static func clearNavigationBar(forBar navBar: UINavigationBar) {
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
    }
}

class ListBooksController: WBooksViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let titles = ["A Little Bird Told Me", "When the Doves Disappeared", "The Best Book in the World", "Be Creative", "Redesign the Web" ]
    
    let subTitles = ["Timothy Cross", "Sofi Oksanen", "Peter Sjernstrom", "Tony Alcazar","Liliana Castilla"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9647058824, blue: 0.9803921569, alpha: 1)
        tableView.rowHeight = UITableView.automaticDimension
        let nibName = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "tableViewCell")
    }
}


extension ListBooksController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        cell.commonInit("img_book\(indexPath.item+1)", title: titles[indexPath.item], sub: subTitles[indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = DetailsBook()
        details.commonInit("img_book\(indexPath.item+1)", titleBook: titles[indexPath.item])
        self.navigationController?.pushViewController(details, animated: true)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}









