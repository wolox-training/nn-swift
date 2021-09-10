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
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationBar.titleTextAttributes = textAttributes
        
        navigationBar.setBackgroundImage(UIImage(named: "bc_nav bar.png")!.resizableImage(withCapInsets: UIEdgeInsets(top: 0,left: 0, bottom: 0 ,right: 0), resizingMode: .stretch), for: .default)
        navigationBar.shadowImage = UIImage()
        
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let backImage = UIImage(named: "ic_back.png")!
        navigationBar.backIndicatorImage = backImage
        navigationBar.backIndicatorTransitionMaskImage = backImage
    }
    
    @objc private func logout() {
        dismiss(animated: true, completion: nil)
    }
}
