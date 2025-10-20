import SwiftUI

public extension View {
  @ViewBuilder
  func apply<Content: View>(
    if condition: Bool,
    transformation: (Self) -> Content
  ) -> some View {
    if condition {
      transformation(self)
    } else {
      self
    }
  }
}

