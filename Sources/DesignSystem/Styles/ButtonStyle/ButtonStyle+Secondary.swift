import SwiftUI

public extension ButtonStyle where Self == SecondaryButtonStyle {
  static var secondary: Self { .init() }
}

public struct SecondaryButtonStyle: ButtonStyle {
  @Environment(\.buttonTheme) private var theme
  @Environment(\.isEnabled) private var isEnabled

  public func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .font(theme.secondary.font)
      .foregroundStyle(
        isEnabled
        ? theme.secondary.baseColor
        : theme.secondary.disabledBaseColor
      )
      .padding(
        .horizontal,
        theme.secondary.horizontalPadding
      )
      .frame(
        maxWidth: theme.secondary.maxWidth,
        minHeight: theme.secondary.minHeight
      )
      .background(
        RoundedRectangle(cornerRadius: theme.secondary.cornerRadius)
          .stroke(
            isEnabled
            ? theme.secondary.baseColor
            : theme.secondary.disabledBaseColor,
            lineWidth: theme.secondary.borderWidth
          )
      )
      .contentShape(.rect(cornerRadius: theme.secondary.cornerRadius))
      .opacity(
        configuration.isPressed
        ? theme.secondary.pressedOpacity
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
        .buttonStyle(.secondary)

      Button("Disabled") {}
        .buttonStyle(.secondary)
        .disabled(true)
    }

    VStack(spacing: .spacing200) {
      Button("Enabled") {}
        .buttonStyle(.secondary)

      Button("Disabled") {}
        .buttonStyle(.secondary)
        .disabled(true)
    }
    .environment(\.buttonTheme, .destructive)

    VStack(spacing: .spacing200) {
      Button("Enabled") {}
        .buttonStyle(.secondary)

      Button("Disabled") {}
        .buttonStyle(.secondary)
        .disabled(true)
    }
    .environment(\.buttonTheme, .customSmall)

    VStack(spacing: .spacing200) {
      Button(
        action: {},
        label: { Image(systemName: "plus") }
      )
      .buttonStyle(.secondary)

      Button(
        action: {},
        label: { Image(systemName: "plus") }
      )
      .buttonStyle(.secondary)
      .disabled(true)
    }
    .environment(\.buttonTheme, .customCircle)
  }
  .padding(.spacing200)
}

private extension ButtonTheme {
  static var destructive: Self {
    .init(
      secondary: .init(
        baseColor: .red,
        cornerRadius: .radius300
      )
    )
  }

  static var customSmall: Self {
    .init(
      secondary: .init(
        minHeight: .spacing400,
        maxWidth: nil,
        cornerRadius: .radius200,
        font: .footnote.weight(.semibold)
      )
    )
  }

  static var customCircle: Self {
    .init(
      secondary: .init(
        maxWidth: .spacing600,
        cornerRadius: .radius300
      )
    )
  }
}
#endif
