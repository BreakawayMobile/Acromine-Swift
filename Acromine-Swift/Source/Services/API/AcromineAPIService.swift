//
//  AcromineAPIService.swift
//  Acromine-Swift
//
//  Created by Joe Radjavitch on 5/10/22.
//

import Foundation
import Combine

class AcromineAPIService: AcromineAPIProtocol {
    
    // MARK: - Static Properties
    
    static let shared = AcromineAPIService()
    
    // MARK: - Initialization
    
    private init() { }
    
    // MARK: - Public Properties

    let ACROMINE_BASE_URL = "http://nactem.ac.uk/software/acromine/dictionary.py"
    
    // MARK: - AcromineAPIProtocol

    func getDictionary(using query: String, isLongform: Bool) -> AnyPublisher<[Shortform], APIError> {

        guard let request = makeRequest(using: query, isLongform: isLongform) else {
            return Result.Publisher(APIError.invalidRequestError("Error making request!")).eraseToAnyPublisher()
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return URLSession.shared
            .dataTaskPublisher(for: request)
            .retry(3)
            .map { $0.data }
            .decode(type: [Shortform].self, decoder: decoder)
            .catch { Result.Publisher(APIError.responseError($0.localizedDescription)) }
            .eraseToAnyPublisher()
    }
                                             
    // MARK: - Private Methods

    private func makeRequest(using query: String, isLongform: Bool) -> URLRequest? {
        guard var components = URLComponents(string: ACROMINE_BASE_URL) else { return nil }
        components.queryItems = [URLQueryItem(name: isLongform ? "lf" : "sf", value: query)]

        guard let url = components.url else { return nil }

        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        return request
    }
}
