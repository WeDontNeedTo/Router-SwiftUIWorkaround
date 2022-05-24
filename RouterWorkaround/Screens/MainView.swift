//
//  ScreenView.swift
//  RouterWorkaround
//
//  Created by Данил Ломаев on 24.05.2022.
//

import SwiftUI

enum ScreenRoute: ScreenProtocol {
    case start
    case navigator
    case fullScreen
    case sheetScreen
    
    var embedInNavView: Bool {
        switch self {
        case .start, .sheetScreen:
            return true
        case .navigator, .fullScreen:
            return false
        }
    }
}

class ScreenRouterFactory: RouterFactory {
    
    @ViewBuilder func makeBody(for screen: ScreenRoute) -> some View {
        switch screen {
        case .start:
            StartingView()
        case .navigator:
            RoutesView()
        case .fullScreen:
            FullScreenView()
        case .sheetScreen:
            SheetView()
        }
    }
}

typealias ScreenRouter = Router<ScreenRoute, ScreenRouterFactory>

struct MainView: View {
    @EnvironmentObject var screenRouter: ScreenRouter
    
    var body: some View {
        screenRouter.start()
    }
}

struct ScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
