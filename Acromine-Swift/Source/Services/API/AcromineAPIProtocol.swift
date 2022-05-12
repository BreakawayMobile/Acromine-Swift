//
//  AcromineAPIProtocol.swift
//  Acromine-Swift
//
//  Created by Joe Radjavitch on 5/11/22.
//

import Foundation
import Combine

enum APIError: LocalizedError {
    case invalidRequestError(String)
    case responseError(String)
}

protocol AcromineAPIProtocol {
    func getDictionary(using query: String, isLongform: Bool) -> AnyPublisher<[Shortform], APIError>
}
