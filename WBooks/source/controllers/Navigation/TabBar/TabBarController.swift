//
//  TabBarController.swift
//  WBooks
//
//  Created by noelia.nieres on 17/08/2021.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.barTintColor = .white
        
        let home =  CustomNavigationController(rootViewController: HomeViewController())
        home.tabBarItem = UITabBarItem()
        home.tabBarItem.title = title
        home.tabBarItem.image = UIImage(named: "ic_library active.png")
        home.tabBarItem.tag = 0
        
        let wishList = CustomNavigationController(rootViewController: WishListController())
        wishList.tabBarItem = UITabBarItem()
        wishList.tabBarItem.title = title
        wishList.tabBarItem.image = UIImage(named: "ic_wishlist active.png")
        wishList.tabBarItem.tag = 1

        viewControllers = [home, wishList]
        
        guard let items = tabBar.items else { return }
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0,bottom: -4, right: 0)
        }
    }

}

class WishListController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

