//
//  FullScreenView.swift
//  RouterWorkaround
//
//  Created by Данил Ломаев on 24.05.2022.
//

import SwiftUI

struct FullScreenView: View {
    @EnvironmentObject var screenRouter: ScreenRouter

    var body: some View {
        VStack {
            Button("Close") {
                screenRouter.dismissLast()
            }
        }
    }
}

struct FullScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenView()
    }
}
