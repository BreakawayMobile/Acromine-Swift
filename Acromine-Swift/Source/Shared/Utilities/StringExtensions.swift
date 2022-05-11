//
//  StringExtensions.swift
//  Acromine-Swift
//
//  Created by Joe Radjavitch on 5/11/22.
//

import Foundation

protocol Localizable {
    var localized: String { get }
}

extension String: Localizable {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
