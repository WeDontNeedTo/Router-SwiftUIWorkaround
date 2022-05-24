//
//  StartingView.swift
//  RouterWorkaround
//
//  Created by Данил Ломаев on 24.05.2022.
//

import SwiftUI

struct StartingView: View {
    @EnvironmentObject var screenRouter: ScreenRouter

    var body: some View {
        RoutesView()
            .navigationTitle("Routing")
    }
}

struct StartingView_Previews: PreviewProvider {
    static var previews: some View {
        StartingView()
    }
}
