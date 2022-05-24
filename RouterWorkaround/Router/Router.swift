//
//  RouterObject.swift
//  vkdoc
//
//  Created by Данил Ломаев on 15.04.2022.
//

import Foundation
import SwiftUI
 
enum PresentationType {
    case push
    case full
    case modal
}

protocol ScreenProtocol {
    var embedInNavView: Bool { get }
}

protocol RouterObject: AnyObject {
    associatedtype Screen = ScreenProtocol
    associatedtype Body = View
    
    func start() -> Body
    func navigateTo(_ screen: Screen)
    func presentSheet(_ screen: Screen)
    func presentFullScreen(_ screen: Screen)
    func dismissLast()
    func popToRoot()
}

struct RouterContext<ScreenType: ScreenProtocol> {
    let screen: ScreenType
    let presentationType: PresentationType
}

class Router<ScreenType, Factory: RouterFactory>: ObservableObject, RouterObject where Factory.Screen == ScreenType {
    
    @Published private var stack: [RouterContext<ScreenType>] = []
    var factory: Factory
    
    init(rootScreen: ScreenType, presentationType: PresentationType = .push, factory: Factory) {
        self.stack = [RouterContext(screen: rootScreen, presentationType: presentationType)]
        self.factory = factory
    }
    
    @ViewBuilder func start() -> some View {
        let bindingScreens = Binding(get: {
            return self.stack
        }, set: {
             self.stack = $0
        })
        
        Routing(stack: bindingScreens) { screen in
            self.factory.makeBody(for: screen)
        }
    }
}

extension Router {
    func presentSheet(_ screen: ScreenType) {
        self.stack.append(RouterContext(screen: screen, presentationType: .modal))
    }
    
    func dismissLast() {
        self.stack.removeLast()
    }
    
    func navigateTo(_ screen: ScreenType) {
        self.stack.append(RouterContext(screen: screen, presentationType: .push))
    }
    
    func presentFullScreen(_ screen: ScreenType) {
        self.stack.append(RouterContext(screen: screen, presentationType: .full))
    }
    
    func popToRoot() {
        self.stack.removeLast(self.stack.count - 1)
    }
}
