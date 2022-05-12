//
//  MockAcromineAPIService.swift
//  Acromine-Swift
//
//  Created by Joe Radjavitch on 5/11/22.
//

import Foundation
import Combine

class MockAcromineAPIService: AcromineAPIProtocol {
    
    // MARK: - Static Properties
    
    static let shared = MockAcromineAPIService()
    
    // MARK: - Initialization
    
    private init() { }
        
    // MARK: - AcromineAPIProtocol

    func getDictionary(using query: String, isLongform: Bool) -> AnyPublisher<[Shortform], APIError> {
        var filePath = Bundle.main.path(forResource: "Empty", ofType: "json")
        
        switch (query, isLongform) {
        case ("HMM", true):
            filePath = Bundle.main.path(forResource: "HMM_lf", ofType: "json")
        case ("HMM", false):
            filePath = Bundle.main.path(forResource: "HMM", ofType: "json")
        default:
            break
        }
        
        guard let path = filePath, let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            return Result.Publisher(APIError.invalidRequestError("Could not open file!")).eraseToAnyPublisher()
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return Just(data)
            .decode(type: [Shortform].self, decoder: decoder)
            .catch { Result.Publisher(APIError.responseError($0.localizedDescription)) }
            .eraseToAnyPublisher()
    }
    
    // MARK: - Public Methods
    
    func shortFormMock() -> [AcromineResponse] {
        return responses(from: "HMM", type: [Shortform].self) ?? []
    }
    
    func longFormMock() -> [AcromineResponse] {
        return responses(from: "HMM_lf", type: [Shortform].self) ?? []
    }

    func emptyMock() -> [AcromineResponse] {
        []
    }
    
    // MARK: - Private Methods
    
    private func responses<T>(from fileName: String, type: T.Type) -> T? where T: Decodable {
        let filePath = Bundle.main.path(forResource: fileName, ofType: "json")

        guard let path = filePath, let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            return nil
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        guard let responses = try? decoder.decode(type, from: data) else {
            return nil
        }
        
        return responses
    }
}
