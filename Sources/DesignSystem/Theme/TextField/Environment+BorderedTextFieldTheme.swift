import SwiftUI

public extension EnvironmentValues {
  /// The bordered text field theme for the current environment.
  ///
  /// Use this to customize the appearance of BorderedTextField components.
  @Entry var borderedTextFieldTheme: BorderedTextFieldTheme = .init()
}

/// A theme configuration for BorderedTextField components.
///
/// `BorderedTextFieldTheme` provides comprehensive styling options for text fields,
/// including colors, borders, validation states, and animations.
///
/// ## Basic Usage
///
/// ```swift
/// let customTheme = BorderedTextFieldTheme(
///     color: .green,
///     backgroundColor: .white,
///     validationColor: .orange
/// )
///
/// BorderedTextField(text: $text, prompt: "Username")
///     .environment(\.borderedTextFieldTheme, customTheme)
/// ```
///
/// ## Customizing Clear Button
///
/// ```swift
/// let themeWithoutClear = BorderedTextFieldTheme(
///     clearButtonIcon: nil
/// )
///
/// BorderedTextField(text: $text)
///     .environment(\.borderedTextFieldTheme, themeWithoutClear)
/// ```
///
@Observable
public final class BorderedTextFieldTheme {
  /// The border color when focused and valid.
  let color: Color
  /// The text color when not focused.
  let textColor: Color
  /// The text color when focused.
  let enabledTextColor: Color
  /// The background color of the text field.
  let backgroundColor: Color
  /// The color used for validation errors.
  let validationColor: Color
  /// The width of the border stroke.
  let borderWidth: CGFloat
  /// The height of the text field.
  let height: CGFloat
  /// The corner radius of the text field.
  let cornerRadius: CGFloat
  /// The animation used for state transitions.
  let animation: Animation
  /// The icon for the clear button. Set to nil to hide the clear button.
  let clearButtonIcon: Image?

  /// Creates a bordered text field theme configuration.
  ///
  /// - Parameters:
  ///   - color: The focused border color (default is `.blue`).
  ///   - textColor: The unfocused text color (default is `.gray`).
  ///   - enabledTextColor: The focused text color (default is `.black`).
  ///   - backgroundColor: The background color (default is `.white`).
  ///   - validationColor: The validation error color (default is `.red`).
  ///   - borderWidth: The border stroke width (default is `2`).
  ///   - height: The text field height (default is `24`).
  ///   - cornerRadius: The corner radius (default is `12`).
  ///   - animation: The transition animation (default is `.bouncy(extraBounce: 0.15)`).
  ///   - clearButtonIcon: The clear button icon (default is `Image(systemName: "xmark.circle")`). Set to nil to hide.
  public init(
    color: Color = .blue,
    textColor: Color = .gray,
    enabledTextColor: Color = .black,
    backgroundColor: Color = .white,
    validationColor: Color = .red,
    borderWidth: CGFloat = 2,
    height: CGFloat = 24,
    cornerRadius: CGFloat = 12,
    animation: Animation = .bouncy(extraBounce: 0.15),
    clearButtonIcon: Image? = Image(systemName: "xmark.circle")
  ) {
    self.color = color
    self.textColor = textColor
    self.enabledTextColor = enabledTextColor
    self.backgroundColor = backgroundColor
    self.validationColor = validationColor
    self.borderWidth = borderWidth
    self.height = height
    self.cornerRadius = cornerRadius
    self.animation = animation
    self.clearButtonIcon = clearButtonIcon
  }
}
