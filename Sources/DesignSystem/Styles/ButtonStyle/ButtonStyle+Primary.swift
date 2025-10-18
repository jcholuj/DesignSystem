import SwiftUI

public extension ButtonStyle where Self == PrimaryButtonStyle {
  static var primary: Self { .init() }
}

public struct PrimaryButtonStyle: ButtonStyle {
  @Environment(\.buttonTheme) private var theme
  @Environment(\.isEnabled) private var isEnabled

  public func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .font(theme.primary.font)
      .foregroundStyle(
        isEnabled
        ? theme.primary.textColor
        : theme.primary.disabledTextColor
      )
      .padding(
        .horizontal,
        theme.primary.horizontalPadding
      )
      .frame(
        maxWidth: theme.primary.maxWidth,
        minHeight: theme.primary.minHeight
      )
      .background(
        isEnabled
        ? theme.primary.baseColor
        : theme.primary.disabledBaseColor
      )
      .clipShape(.rect(cornerRadius: theme.primary.cornerRadius))
      .contentShape(.rect(cornerRadius: theme.primary.cornerRadius))
      .opacity(
        configuration.isPressed
        ? theme.primary.pressedOpacity
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
        .buttonStyle(.primary)

      Button("Disabled") {}
        .buttonStyle(.primary)
        .disabled(true)
    }

    VStack(spacing: .spacing200) {
      Button("Enabled") {}
        .buttonStyle(.primary)

      Button("Disabled") {}
        .buttonStyle(.primary)
        .disabled(true)
    }
    .environment(\.buttonTheme, .destructive)

    VStack(spacing: .spacing200) {
      Button("Enabled") {}
        .buttonStyle(.primary)

      Button("Disabled") {}
        .buttonStyle(.primary)
        .disabled(true)
    }
    .environment(\.buttonTheme, .customSmall)

    VStack(spacing: .spacing200) {
      Button(
        action: {},
        label: { Image(systemName: "plus") }
      )
      .buttonStyle(.primary)

      Button(
        action: {},
        label: { Image(systemName: "plus") }
      )
      .buttonStyle(.primary)
      .disabled(true)
    }
    .environment(\.buttonTheme, .customCircle)
  }
  .padding(.spacing200)
}

private extension ButtonTheme {
  static var destructive: Self {
    .init(
      primary: .init(
        baseColor: .red,
        cornerRadius: .radius300
      )
    )
  }

  static var customSmall: Self {
    .init(
      primary: .init(
        minHeight: .spacing400,
        maxWidth: nil,
        cornerRadius: .radius200,
        font: .footnote.weight(.semibold)
      )
    )
  }

  static var customCircle: Self {
    .init(
      primary: .init(
        maxWidth: .spacing600,
        cornerRadius: .radius300
      )
    )
  }
}
#endif
