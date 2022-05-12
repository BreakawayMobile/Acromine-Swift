//
//  AcromineResponse.swift
//  Acromine-Swift
//
//  Created by Joe Radjavitch on 5/10/22.
//

import Foundation

class AcromineResponse: Codable, Identifiable, Equatable {
    
    // MARK: - Public Properties

    let id = UUID()
    var children: [AcromineResponse]? = []
    var title: String = ""
    
    // MARK: - Codable

    required init(from decoder: Decoder) throws { }

    func encode(from encoder: Encoder) throws { }
    
    // MARK: - Equatable
    
    static func ==(lhs: AcromineResponse, rhs: AcromineResponse) -> Bool {
        return lhs.children == rhs.children
    }
}

// MARK: - Mock Objects

extension Mock {
    var mockAcromineResponse: AcromineResponse {
        return MockAcromineAPIService.shared.shortFormMock().first!
    }
}

// NOTE: Here ia an attempt at using an enum for the API response.
// The list would be received and decoded properly, but would not display
// as a nested list in the UI.

//enum AcromineResponse: Decodable, Identifiable {
//
//    var id: String {
//        return UUID().uuidString
//    }
//
//    var children: [AcromineResponse]? {
//        switch self {
//        case .vars(_, _, _):
//            print("*** children = nil")
//            return nil
//        case .longform(_, _, _, let vars):
//            print("*** children = \(vars.count)")
//            return vars
//        case .shortform(_, let lfs):
//            print("*** children = \(lfs.count)")
//            return lfs
//        }
//    }
//
//    var title: String {
//        switch self {
//        case .vars(let lf, _, _): return lf
//        case .longform(let lf, _, _, _): return lf
//        case .shortform(let sf, _): return sf
//        }
//    }
//
//    case shortform(sf: String, lfs: [AcromineResponse])
//    case longform(lf: String, freq: Int, since: Int, vars: [AcromineResponse])
//    case vars(lf: String, freq: Int, since: Int)
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        if let sf = try? container.decode(String.self, forKey: .sf),
//           let lfs = try? container.decode([AcromineResponse].self, forKey: .lfs) {
//            self = .shortform(sf: sf,
//                              lfs: lfs)
//        } else if let lf = try? container.decode(String.self, forKey: .lf),
//                  let freq = try? container.decode(Int.self, forKey: .freq),
//                  let since = try? container.decode(Int.self, forKey: .since),
//                  let vars = try? container.decode([AcromineResponse].self, forKey: .vars) {
//            self = .longform(lf: lf,
//                             freq: freq,
//                             since: since,
//                             vars: vars)
//        } else if let lf = try? container.decode(String.self, forKey: .lf),
//            let freq = try? container.decode(Int.self, forKey: .freq),
//                  let since = try? container.decode(Int.self, forKey: .since) {
//            self = .vars(lf: lf, freq: freq, since: since)
//        } else {
//            self = .shortform(sf: "", lfs: [])
//        }
//    }
//
//    init() {
//        self = .shortform(sf: "", lfs: [])
//    }
//
//    static let Empty = AcromineResponse()
//
//    private enum CodingKeys: String, CodingKey {
//        case sf
//        case lf
//        case freq
//        case since
//        case lfs
//        case vars
//    }
//}
//
