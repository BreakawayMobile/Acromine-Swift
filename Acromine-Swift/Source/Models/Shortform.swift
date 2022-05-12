//
//  Shortform.swift
//  Acromine-Swift
//
//  Created by Joe Radjavitch on 5/11/22.
//

import Foundation

class Shortform: AcromineResponse {
    
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

    // MARK: - Codable

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sf = try values.decode(String.self, forKey: .sf)
        lfs = try values.decode([Longform].self, forKey: .lfs)
        
        try super.init(from: decoder)
    }
    
    override func encode(from encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.sf, forKey: .sf)
        try container.encode(self.lfs, forKey: .lfs)
        
        try super.encode(from: encoder)
    }

    // MARK: - Coding Keys

    private enum CodingKeys: String, CodingKey {
        case sf
        case lfs
    }
    
    // MARK: - Equatable
    
    static func ==(lhs: Shortform, rhs: Shortform) -> Bool {
        return lhs.sf == rhs.sf &&
            lhs.lfs == rhs.lfs &&
            (lhs as AcromineResponse) == (rhs as AcromineResponse)
    }
}

// MARK: - Mock Objects

extension Mock {
    var mockShortForm: Shortform {
        return MockAcromineAPIService.shared.shortFormMock().first as! Shortform
    }
}
