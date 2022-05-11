//
//  Longform.swift
//  Acromine-Swift
//
//  Created by Joe Radjavitch on 5/11/22.
//

import Foundation

class Longform: LongformBase {
    
    // MARK: - Public Properties

    var vars: [LongformBase] = []

    override var children: [AcromineResponse]? {
        get {
            return vars
        }
        set {
            super.children = newValue
        }
    }
    
    // MARK: - Initialization

    internal init(vars: [LongformBase] = []) {
        super.init()
        self.vars = vars
    }

    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        vars = try values.decode([LongformBase].self, forKey: .vars)
    }

    // MARK: - Coding Keys

    private enum CodingKeys: String, CodingKey {
        case vars
    }
}

// MARK: - Mock Objects

extension Mock {
    var mockLongform: Longform {
        return Longform(vars: [mockLongformBase])
    }
}
