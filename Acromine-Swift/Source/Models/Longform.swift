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
    
    // MARK: - Codable

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        vars = try values.decode([LongformBase].self, forKey: .vars)
        
        try super.init(from: decoder)
    }

    override func encode(from encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.vars, forKey: .vars)

        try super.encode(from: encoder)
    }

    // MARK: - Coding Keys

    private enum CodingKeys: String, CodingKey {
        case vars
    }
    
    // MARK: - Equatable
    
    static func ==(lhs: Longform, rhs: Longform) -> Bool {
        return lhs.vars == rhs.vars &&
            (lhs as LongformBase) == (rhs as LongformBase)
    }
}

// MARK: - Mock Objects

extension Mock {
    var mockLongform: Longform {
        let shortForm = MockAcromineAPIService.shared.shortFormMock().first as! Shortform
        return shortForm.lfs.first!
    }
}
