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
        home.tabBarItem.title = "Library"
        home.tabBarItem.image = UIImage(named: "ic_library.png")
        home.tabBarItem.selectedImage = UIImage(named: "ic_library active.png")
        home.tabBarItem.tag = 0
        
        let wish = CustomNavigationController(rootViewController: WishViewController())
        wish.tabBarItem = UITabBarItem()
        wish.tabBarItem.title = "WishList"
        wish.tabBarItem.image = UIImage(named: "ic_wishlist.png")
        wish.tabBarItem.selectedImage = UIImage(named: "ic_wishlist active.png")
        wish.tabBarItem.tag = 1
        
        let newBook = CustomNavigationController(rootViewController: NewBookViewController())
        newBook.tabBarItem = UITabBarItem()
        newBook.tabBarItem.title = "Add New"
        newBook.tabBarItem.image = UIImage(named: "ic_add new.png")
        newBook.tabBarItem.selectedImage = UIImage(named: "ic_add new active.png")
        newBook.tabBarItem.tag = 2
        
        let rents = CustomNavigationController(rootViewController: RentViewController())
        rents.tabBarItem = UITabBarItem()
        rents.tabBarItem.title = "Rentals"
        rents.tabBarItem.image = UIImage(named: "ic_myrentals.png")
        rents.tabBarItem.selectedImage = UIImage(named: "ic_myrentals active.png")
        rents.tabBarItem.tag = 3
        
        let setting = CustomNavigationController(rootViewController: SettingController())
        setting.tabBarItem = UITabBarItem()
        setting.tabBarItem.title = "Setting"
        setting.tabBarItem.image = UIImage(named: "ic_settings.png")
        setting.tabBarItem.selectedImage = UIImage(named: "ic_settings active.png")
        setting.tabBarItem.tag = 4

        viewControllers = [home,wish, newBook,rents,setting]
        
        guard let items = tabBar.items else { return }
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0,bottom: -4, right: 0)
        }
    }
}

class SettingController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SETTING"
        view.backgroundColor = .backgroundPolar()
    }
}
