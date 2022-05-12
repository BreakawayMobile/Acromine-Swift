//
//  LongformBase.swift
//  Acromine-Swift
//
//  Created by Joe Radjavitch on 5/11/22.
//

import Foundation

class LongformBase: AcromineResponse  {

    // MARK: - Public Properties

    var lf: String
    var freq: Int
    var since: Int
    
    override var children: [AcromineResponse]? {
        get {
            return nil
        }
        set {
            super.children = newValue
        }
    }
    
    override var title: String {
        get {
            return lf
        }
        set {
            super.title = newValue
        }
    }
    
    // MARK: - Codable

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        lf = try values.decode(String.self, forKey: .lf)
        freq = try values.decode(Int.self, forKey: .freq)
        since = try values.decode(Int.self, forKey: .since)

        try super.init(from: decoder)
    }

    override func encode(from encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.lf, forKey: .lf)
        try container.encode(self.freq, forKey: .freq)
        try container.encode(self.since, forKey: .since)

        try super.encode(from: encoder)
    }

    // MARK: - Coding Keys

    private enum CodingKeys: String, CodingKey {
        case lf
        case freq
        case since
    }
    
    // MARK: - Equatable
    
    static func ==(lhs: LongformBase, rhs: LongformBase) -> Bool {
        return lhs.lf == rhs.lf &&
            lhs.freq == rhs.freq &&
            lhs.since == rhs.since &&
            (lhs as AcromineResponse) == (rhs as AcromineResponse)
    }
}

// MARK: - Mock Objects

extension Mock {
    var mockLongformBase: LongformBase {
        let shortForm = MockAcromineAPIService.shared.shortFormMock().first as! Shortform
        let longForm = shortForm.lfs.first!
        return longForm.vars.first!
    }
}
