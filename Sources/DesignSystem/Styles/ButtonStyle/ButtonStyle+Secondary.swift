import SwiftUI

public extension ButtonStyle where Self == SecondaryButtonStyle {
  /// A secondary button style with outlined appearance.
  ///
  /// Use this style for secondary actions that need less emphasis than primary buttons.
  static var secondary: Self { .init() }
}

/// An outlined button style representing secondary actions in your interface.
///
/// `SecondaryButtonStyle` creates buttons with a bordered outline and no background fill,
/// making them visually subordinate to primary buttons while still being clearly interactive.
///
/// ## Basic Usage
///
/// ```swift
/// Button("Cancel") {
///     // Action
/// }
/// .buttonStyle(.secondary)
/// ```
///
/// ## Customizing with Theme
///
/// ```swift
/// let customTheme = ButtonTheme(
///     secondary: .init(
///         baseColor: .red,
///         borderWidth: 2,
///         cornerRadius: .radius200
///     )
/// )
///
/// Button("Delete") { }
///     .buttonStyle(.secondary)
///     .environment(\.buttonTheme, customTheme)
/// ```
///
/// - Note: Automatically handles disabled and pressed states with visual feedback.
///
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
