//
//  ShortformRow.swift
//  Acromine-Swift
//
//  Created by Joe Radjavitch on 5/11/22.
//

import SwiftUI

struct ShortformRowView: View {
    
    // MARK: - Public Properties

    var sf: Shortform

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading) {
            DetailItemView(title: "sf:", value: "\(sf.sf)")
        }
    }
}

// MARK: - Previews

struct ShortformRowView_Previews: PreviewProvider {
    static var previews: some View {
        ShortformRowView(sf: Mock.shared.mockShortForm)
    }
}
