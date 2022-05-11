//
//  VarsRow.swift
//  Acromine-Swift
//
//  Created by Joe Radjavitch on 5/11/22.
//

import SwiftUI

struct VarsRowView: View {
    
    // MARK: - Public Properties

    var lfb: LongformBase

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading) {
            DetailItemView(title: "lf:", value: "\(lfb.lf)")
            DetailItemView(title: "freq:", value: "\(lfb.freq)")
            DetailItemView(title: "since:", value: "\(lfb.since)")
        }
    }
}

// MARK: - Previews

struct VarsRowView_Previews: PreviewProvider {
    static var previews: some View {
        VarsRowView(lfb: Mock.shared.mockLongformBase)
    }
}
