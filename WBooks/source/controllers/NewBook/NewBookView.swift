//
//  NewBookView.swift
//  WBooks
//
//  Created by noelia.nieres on 30/08/2021.
//

import UIKit

final class NewBookView: NibView{

    @IBOutlet weak var imageBook: UIImageView!
    @IBOutlet weak var nameBook: UITextField!
    @IBOutlet weak var authorBook: UITextField!
    @IBOutlet weak var yearBook: UITextField!
    @IBOutlet weak var topicBook: UITextField!
    @IBOutlet weak var descriptionBook: UITextField!
    @IBOutlet weak var submitButton: UIButton!
}
