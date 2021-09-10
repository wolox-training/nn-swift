//
//  BarButtonItemExtension.swift
//  WBooks
//
//  Created by noelia.nieres on 09/09/2021.
//
import Foundation
import UIKit

extension UIBarButtonItem {
    
    public static var searchButton: UIBarButtonItem {
        return UIBarButtonItem(image: UIImage(named: "ic_search.png"), style: UIBarButtonItem.Style.plain, target: self, action: nil)
    }
    public static var notificationsButton: UIBarButtonItem {
        return UIBarButtonItem(image: UIImage(named: "ic_notifications.png"), style: UIBarButtonItem.Style.plain, target: self, action: nil)
    }
}
