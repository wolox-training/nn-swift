//
//  CustomNavigationController.swift
//  WBooks
//
//  Created by noelia.nieres on 30/08/2021.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        bookInit()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        bookInit()
    }
    
    // MARK: - Private
    private func bookInit() {
        navigationBar.isTranslucent = true
        navigationBar.tintColor = .white
        navigationBar.barStyle = .default
        navigationBar.backgroundColor = .backgroundPolar()
        
        let img = UIImage(named: "bc_nav bar")
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationBar.titleTextAttributes = textAttributes
        
        navigationBar.setBackgroundImage(img!.resizableImage(withCapInsets: UIEdgeInsets(top: 0,left: 0, bottom: 0 ,right: 0), resizingMode: .stretch), for: .default)
        navigationBar.shadowImage = UIImage()
        
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let backImage = UIImage(named: "ic_back")!
        navigationBar.backIndicatorImage = backImage
        navigationBar.backIndicatorTransitionMaskImage = backImage
        
        // common configuration
        if let viewController = viewControllers.first {
            let logout = UIBarButtonItem(image: UIImage(named: "logout"), style: .plain, target: self, action: #selector(self.logout))
            viewController.navigationItem.leftBarButtonItem = logout
            
            let backItem = UIBarButtonItem()
            backItem.title = ""
            viewController.navigationItem.backBarButtonItem = backItem
        }
    }
    
    @objc private func logout() {
        dismiss(animated: true, completion: nil)
    }
}
