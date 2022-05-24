//
//  RouterFactory.swift
//  vkdoc
//
//  Created by Данил Ломаев on 18.04.2022.
//

import Foundation
import SwiftUI

protocol RouterFactory {
    associatedtype Body: View
    associatedtype Screen: ScreenProtocol
    
    @ViewBuilder func makeBody(for screen: Screen) -> Self.Body
}
