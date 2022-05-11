//
//  LongformView.swift
//  Acromine-Swift
//
//  Created by Joe Radjavitch on 5/11/22.
//

import SwiftUI

struct LongformRowView: View {

    // MARK: - Public Properties

    var lf: Longform

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading) {
            DetailItemView(title: "lf:", value: "\(lf.lf)")
            DetailItemView(title: "freq:", value: "\(lf.freq)")
            DetailItemView(title: "since:", value: "\(lf.since)")
        }
    }
}

// MARK: - Properties

struct LongformRowView_Previews: PreviewProvider {
    static var previews: some View {
        LongformRowView(lf: Mock.shared.mockLongform)
    }
}
