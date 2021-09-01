//
//  CustomNavigationController.swift
//  WBooks
//
//  Created by noelia.nieres on 30/08/2021.
//

import UIKit


struct System {
    static func clearNavigationBar(forBar navBar: UINavigationBar) {
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
    }
}

class CustomNavigationController: UINavigationController {

    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        woloxBookInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        woloxBookInit()
   
    }
    private func configureNavBar() {
        
        navigationBar.isTranslucent = true
        
        let img = UIImage(named: "bc_nav bar")
        //navigationBar.setBackgroundImage(img, for: .default)
        //navigationBar.shadowImage = UIImage()
        //navigationBar.layoutIfNeeded()
        
        navigationBar.shadowImage = UIImage()
        navigationBar.tintColor = .white
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationBar.backgroundColor = UIColor(red: 0.92, green: 0.96, blue: 0.98, alpha: 1)
        //navigationBar.setBackgroundImage(UIImage(named: "bc_nav bar")!.resizableImage(withCapInsets: .zero, resizingMode: .stretch), for: .default)
        navigationBar.setBackgroundImage(img!.resizableImage(withCapInsets: UIEdgeInsets(top: 0,left: 0, bottom: 0 ,right: 0), resizingMode: .stretch), for: .default)
        
    }
    // MARK: - Private
    private func woloxBookInit() {
        navigationBar.isTranslucent = true
        navigationBar.tintColor = .white
        //navigationBar.barStyle = .default
        
        let img = UIImage(named: "bc_nav bar")
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationBar.titleTextAttributes = textAttributes
        navigationBar.backgroundColor = UIColor(red: 0.92, green: 0.96, blue: 0.98, alpha: 1)
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
