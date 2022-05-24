//
//  SheetView.swift
//  RouterWorkaround
//
//  Created by Данил Ломаев on 24.05.2022.
//

import SwiftUI

struct SheetView: View {
    @EnvironmentObject var screenRouter: ScreenRouter
    
    var body: some View {
        List {
            Section {
                Button("Close") {
                    screenRouter.dismissLast()
                }
            }
        }
        .navigationTitle("Sheet")
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
