import SwiftUI

public extension ButtonStyle where Self == TertiaryButtonStyle {
  static var tertiary: Self { .init() }
}

public struct TertiaryButtonStyle: ButtonStyle {
  @Environment(\.buttonTheme) private var theme
  @Environment(\.isEnabled) private var isEnabled

  public func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .font(theme.tertiary.font)
      .foregroundStyle(
        isEnabled
        ? theme.tertiary.baseColor
        : theme.tertiary.disabledBaseColor
      )
      .frame(
        maxWidth: theme.tertiary.maxWidth,
        minHeight: theme.tertiary.minHeight
      )
      .contentShape(.rect)
      .opacity(
        configuration.isPressed
        ? theme.tertiary.pressedOpacity
        : .defaultOpacity
      )
  }
}

private extension Double {
  static let defaultOpacity = 1.0
}

#if DEBUG
#Preview {
  VStack(spacing: .spacing600) {
    VStack(spacing: .spacing200) {
      Button("Enabled") {}
        .buttonStyle(.tertiary)

      Button("Disabled") {}
        .buttonStyle(.tertiary)
        .disabled(true)
    }

    VStack(spacing: .spacing200) {
      Button("Enabled") {}
        .buttonStyle(.tertiary)

      Button("Disabled") {}
        .buttonStyle(.tertiary)
        .disabled(true)
    }
    .environment(\.buttonTheme, .destructive)

    VStack(spacing: .spacing200) {
      Button("Enabled") {}
        .buttonStyle(.tertiary)

      Button("Disabled") {}
        .buttonStyle(.tertiary)
        .disabled(true)
    }
    .environment(\.buttonTheme, .customSmall)
  }
  .padding(.spacing200)
}

private extension ButtonTheme {
  static var destructive: Self {
    .init(tertiary: .init(baseColor: .red))
  }

  static var customSmall: Self {
    .init(
      tertiary: .init(
        minHeight: .spacing400,
        maxWidth: nil,
        font: .footnote.weight(.semibold)
      )
    )
  }
}
#endif
