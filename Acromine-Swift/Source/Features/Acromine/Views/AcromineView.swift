//
//  ContentView.swift
//  Acromine-Swift
//
//  Created by Joe Radjavitch on 5/9/22.
//

import SwiftUI

struct AcromineView: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel = AcromineViewModel()
    
    // MARK: - Body

    var body: some View {
        VStack {
            // Enter text to search for
            TextField("acromine.view.search.title".localized, text: $viewModel.text)
                .disableAutocorrection(true)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            // Make a longform or shortform request?
            HStack {
                Text("acromine.view.picker.title".localized)
                    .font(.headline)
                
                Spacer()
                
                Picker("acromine.view.picker.title".localized,
                       selection: $viewModel.longformRequest) {
                    Text("picker.yes".localized).tag(true)
                    Text("picker.no".localized).tag(false)
                }
            }.padding(.horizontal, 10)
            
            // List of results
            List(viewModel.responses, children: \.children) { response in
                AcromineRowView(response: response)
            }
            
            Spacer()
        }
        .padding()
    }
}

// MARK: - Preview

struct AcromineView_Previews: PreviewProvider {
    static var previews: some View {
        AcromineView()
    }
}

// NOTE: Here ia an attempt at using an enum for the API response.
// The list would be received and decoded properly, but would not display
// as a nested list in the UI.

//struct AcromineRowView: View {
//    var response: AcromineResponse
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text(response.sf)
//                .font(.custom("Avenir Next Regular", size: 14))
//
//            if !response.lfs.isEmpty {
//                Section {
//                    ForEach(response.lfs) { lf in
//                        LongformRowView(lf: lf)
//                    }
//                }.padding(.leading)
//            }
//        }
//        .padding(.horizontal, 10)
//        .background(Color.green)
//    }
//}
//
//struct LongformRowView: View {
//    var lf: Longform
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text(lf.lf)
//            Text("\(lf.freq)")
//            Text("\(lf.since)")
//
//            //Here.................
//            if !lf.vars.isEmpty {
//                Section {
//                    ForEach(lf.vars) { lfb in
//                        LongformBaseRowView(lfb: lfb)
//                    }
//                }.padding(.leading)
//            }
//        }
//        .padding(.horizontal, 10)
//        .background(Color.green)
//    }
//}
//
//struct LongformBaseRowView: View {
//    var lfb: LongformBase
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text(lfb.lf)
//            Text("\(lfb.freq)")
//            Text("\(lfb.since)")
//        }.background(Color.gray)
//    }
//}
