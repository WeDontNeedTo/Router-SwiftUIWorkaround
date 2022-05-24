//
//  ContentView.swift
//  RouterWorkaround
//
//  Created by Данил Ломаев on 24.05.2022.
//

import SwiftUI

struct ContentView: View {
    let screenRouter = ScreenRouter(rootScreen: .start, factory: ScreenRouterFactory())
    
    var body: some View {
        MainView()
            .environmentObject(screenRouter)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
