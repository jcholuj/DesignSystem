import SwiftUI

public extension ButtonStyle where Self == TertiaryButtonStyle {
  /// A tertiary button style with text-only appearance.
  ///
  /// Use this style for the least emphasized actions, such as "Learn More" or auxiliary options.
  static var tertiary: Self { .init() }
}

/// A text-only button style representing tertiary actions in your interface.
///
/// `TertiaryButtonStyle` creates minimalist buttons with no background or border,
/// showing only colored text. Perfect for low-emphasis actions.
///
/// ## Basic Usage
///
/// ```swift
/// Button("Learn More") {
///     // Action
/// }
/// .buttonStyle(.tertiary)
/// ```
///
/// ## Customizing with Theme
///
/// ```swift
/// let customTheme = ButtonTheme(
///     tertiary: .init(
///         baseColor: .purple,
///         font: .callout.weight(.semibold)
///     )
/// )
///
/// Button("Skip") { }
///     .buttonStyle(.tertiary)
///     .environment(\.buttonTheme, customTheme)
/// ```
///
/// - Note: Automatically handles disabled and pressed states with visual feedback.
///
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
