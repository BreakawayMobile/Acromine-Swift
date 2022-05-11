//
//  LongformBase.swift
//  Acromine-Swift
//
//  Created by Joe Radjavitch on 5/11/22.
//

import Foundation

class LongformBase: AcromineResponse, Decodable  {

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
    
    // MARK: - Initialization

    internal init(lf: String = "Longform Name",
         freq: Int = 1500,
         since: Int = 1970) {
        
        self.lf = lf
        self.freq = freq
        self.since = since
    }
}

// MARK: - Mock Objects

extension Mock {
    var mockLongformBase: LongformBase {
        return LongformBase()
    }
}
