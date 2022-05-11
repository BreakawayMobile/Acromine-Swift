//
//  AcromineViewModel.swift
//  Acromine-Swift
//
//  Created by Joe Radjavitch on 5/10/22.
//

import Foundation
import Combine

class AcromineViewModel: ObservableObject {
    
    // MARK: - Public Properties

    @Published var responses: [AcromineResponse] = []
    @Published var longformRequest = false
    @Published var text: String = "" {
        didSet {
            // Each time the user enters a character, fetch the data
            // Tried adding a throttle in order to short circuit multiple charaters entered,
            // but didn't like the results
            fetch()
        }
    }

    // MARK: - Private Properties

    private var _cancellable = Set<AnyCancellable>()

    // MARK: - Public Methods

    func fetch() {
        AcromineAPIService.getDictionary(using: self.text,
                                         isLongform: self.longformRequest).sink(
             receiveCompletion: { [weak self] complete in
                 switch(complete) {
                 case .finished:
                     break
                 case .failure(_):
                     // Normally would bubble this error up to screen, but just pass empty for now.
                     DispatchQueue.main.async { [weak self] in
                         self?.responses = []
                     }
                 }
             },
             receiveValue: { result in
                 DispatchQueue.main.async { [weak self] in
                     self?.responses = result
                 }
             }
        ).store(in: &_cancellable)
    }
}
