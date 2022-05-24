//
//  View + Cover.swift
//  vkdoc
//
//  Created by Данил Ломаев on 18.04.2022.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder func present<Content: View>(asSheet: Bool, isPresented: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) -> some View {
      if asSheet {
        self.sheet(
          isPresented: isPresented,
          onDismiss: nil,
          content: content
        )
      } else {
        self.fullScreenCover(
          isPresented: isPresented,
          onDismiss: nil,
          content: content
        )
      }
    }
}
