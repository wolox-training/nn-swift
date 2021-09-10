//
//  DateExtension.swift
//  WBooks
//
//  Created by noelia.nieres on 10/09/2021.
//
import Foundation

extension Date {
    static func customDate(with date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
}
