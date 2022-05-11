//
//  Shortform.swift
//  Acromine-Swift
//
//  Created by Joe Radjavitch on 5/11/22.
//

import Foundation

class Shortform: AcromineResponse, Decodable {
    
    // MARK: - Public Properties

    var sf: String
    var lfs: [Longform] = []

    override var children: [AcromineResponse]? {
        get {
            return lfs
        }
        set {
            super.children = newValue
        }
    }
    
    override var title: String {
        get {
            return sf
        }
        set {
            super.title = newValue
        }
    }

    // MARK: - Initialization

    internal init(sf: String) {
        self.sf = sf
    }
}

// MARK: - Mock Objects

extension Mock {
    var mockShortForm: Shortform {
        let shortForm = Shortform(sf: "Shortform Title")
        shortForm.children = [mockLongform]
        return shortForm
    }
}
