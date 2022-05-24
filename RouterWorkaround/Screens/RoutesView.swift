//
//  RoutesView.swift
//  RouterWorkaround
//
//  Created by Данил Ломаев on 24.05.2022.
//

import SwiftUI

struct RoutesView: View {
    @EnvironmentObject var screenRouter: ScreenRouter

    var body: some View {
        List {
            Section {
                Button("Push") {
                    screenRouter.navigateTo(.navigator)
                }
            }
            Section {
                Button("Sheet") {
                    screenRouter.presentSheet(.sheetScreen)
                }
            }
            Section {
                Button("Fullscreen") {
                    screenRouter.presentFullScreen(.fullScreen)
                }
            }
            Section {
                Button("Pop to root") {
                    screenRouter.popToRoot()
                }
            }
        }
    }
}

struct RoutesView_Previews: PreviewProvider {
    static var previews: some View {
        RoutesView()
    }
}
