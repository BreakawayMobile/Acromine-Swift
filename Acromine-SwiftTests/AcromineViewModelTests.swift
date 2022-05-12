//
//  AcromineViewModelTests.swift
//  Acromine-SwiftTests
//
//  Created by Joe Radjavitch on 5/11/22.
//

import XCTest
import Combine
@testable import Acromine_Swift

class AcromineViewModelTests: XCTestCase {

    var viewModel: AcromineViewModel!
    var cancellables = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        if viewModel == nil {
            viewModel = AcromineViewModel(api: MockAcromineAPIService.shared)
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testShortformSuccess() throws {
        let expectation = XCTestExpectation(description: "Publishes one value")

        viewModel.$responses
            .sink(
                receiveCompletion: { completion in
                    guard case .finished = completion else { return }
                },
                receiveValue: { value in
                    if value.isEmpty { return }
                    let mockValue = MockAcromineAPIService.shared.shortFormMock()
                    XCTAssertEqual(value, mockValue)
                    expectation.fulfill()
                }
            )
            .store(in: &cancellables)

        viewModel.longformRequest = false
        viewModel.text = "HMM"
        wait(for: [expectation], timeout: 0.5)
    }
    
    func testLongformSuccess() throws {
        let expectation = XCTestExpectation(description: "Publishes one value")

        viewModel.$responses
            .sink(
                receiveCompletion: { completion in
                    guard case .finished = completion else { return }
                },
                receiveValue: { value in
                    if value.isEmpty { return }
                    let mockValue = MockAcromineAPIService.shared.longFormMock()
                    XCTAssertEqual(value, mockValue)
                    expectation.fulfill()
                }
            )
            .store(in: &cancellables)

        viewModel.longformRequest = true
        viewModel.text = "HMM"
        wait(for: [expectation], timeout: 0.5)
    }

    func testShortformFail() throws {
        let expectation = XCTestExpectation(description: "Publishes one value")
        var shouldSkip = true
        
        viewModel.$responses
            .sink(
                receiveCompletion: { completion in
                    guard case .finished = completion else { return }
                },
                receiveValue: { value in
                    // Skip first empty value
                    if shouldSkip {
                        shouldSkip = false
                        return
                    }
                    let mockValue = MockAcromineAPIService.shared.emptyMock()
                    XCTAssertEqual(value, mockValue)
                    expectation.fulfill()
                }
            )
            .store(in: &cancellables)

        viewModel.longformRequest = false
        viewModel.text = "DDD"
        wait(for: [expectation], timeout: 0.5)
    }
    
    func testLongformFail() throws {
        let expectation = XCTestExpectation(description: "Publishes one value")
        var shouldSkip = true

        viewModel.$responses
            .sink(
                receiveCompletion: { completion in
                    guard case .finished = completion else { return }
                },
                receiveValue: { value in
                    // Skip first empty value
                    if shouldSkip {
                        shouldSkip = false
                        return
                    }
                    let mockValue = MockAcromineAPIService.shared.emptyMock()
                    XCTAssertEqual(value, mockValue)
                    expectation.fulfill()
                }
            )
            .store(in: &cancellables)

        viewModel.longformRequest = true
        viewModel.text = "DDD"
        wait(for: [expectation], timeout: 0.5)
    }
}
