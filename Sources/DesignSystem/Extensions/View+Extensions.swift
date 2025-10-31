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

  func frame(_ size: CGFloat) -> some View {
    self
      .frame(
        width: size,
        height: size
      )
  }

  func shadow200() -> some View {
    self
      .shadow(
        color: Color.black.opacity(0.05),
        radius: .radius100
      )
  }

  func shadow400() -> some View {
    self
      .shadow(
        color: Color.black.opacity(0.10),
        radius: .radius100
      )
  }

  @ViewBuilder
  func container(
    _ padding: CGFloat = .spacing200,
    backgroundColor: Color = .white,
    shouldApplyShadow: Bool = true
  ) -> some View {
    self
      .frame(maxWidth: .infinity)
      .padding(padding)
      .background(backgroundColor)
      .clipShape(.rect(cornerRadius: .radius200))
      .apply(if: shouldApplyShadow) {
        $0.shadow200()
      }
  }
}

