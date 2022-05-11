//
//  AcromineRow.swift
//  Acromine-Swift
//
//  Created by Joe Radjavitch on 5/11/22.
//

import SwiftUI

struct AcromineRowView: View {
    
    // MARK: - Public Properties

    var response: AcromineResponse

    // MARK: - Body

    var body: some View {
        if let lfb = response as? LongformBase {
            VarsRowView(lfb: lfb)
                .listRowBackground(Color.gray)
        } else if let lf = response as? Longform {
            LongformRowView(lf: lf)
                .listRowBackground(Color.green)
        } else if let sf = response as? Shortform {
            ShortformRowView(sf: sf)
                .listRowBackground(Color.yellow)
        }
    }
}

// MARK: - Previews

struct AcromineRowView_Previews: PreviewProvider {
    static var previews: some View {
        AcromineRowView(response: Mock.shared.mockAcromineResponse)
    }
}
