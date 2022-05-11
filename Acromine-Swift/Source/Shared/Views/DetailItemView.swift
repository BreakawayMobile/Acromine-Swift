//
//  DetailItem.swift
//  Acromine-Swift
//
//  Created by Joe Radjavitch on 5/11/22.
//

import SwiftUI

struct DetailItemView: View {

    // MARK: - Public Properties

    var title: String
    var value: String
    
    // MARK: - Body

    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
            Text(value)
                .font(.subheadline)
        }
    }
}

// MARK: - Previews

struct DetailItemView_Previews: PreviewProvider {
    static var previews: some View {
        DetailItemView(title: "Detail Title", value: "Value")
    }
}
