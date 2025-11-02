import SwiftUI

public extension EnvironmentValues {
  /// The bordered text editor theme for the current environment.
  ///
  /// Use this to customize the appearance of BorderedTextEditor components.
  @Entry var borderedTextEditorTheme: BorderedTextEditorTheme = .init()
}

/// A theme configuration for BorderedTextEditor components.
///
/// `BorderedTextEditorTheme` provides comprehensive styling options for multiline text editors,
/// including colors, borders, validation states, and dimensions.
///
/// ## Basic Usage
///
/// ```swift
/// let customTheme = BorderedTextEditorTheme(
///     color: .green,
///     backgroundColor: .white,
///     validationColor: .orange
/// )
///
/// BorderedTextEditor(text: $text, prompt: "Enter description")
///     .environment(\.borderedTextEditorTheme, customTheme)
/// ```
///
/// ## Customizing Height
///
/// ```swift
/// let tallTheme = BorderedTextEditorTheme(
///     minHeight: .spacing250 * 10,
///     maxHeight: .spacing500 * 10
/// )
///
/// BorderedTextEditor(text: $text)
///     .environment(\.borderedTextEditorTheme, tallTheme)
/// ```
///
@Observable
public final class BorderedTextEditorTheme {
  /// The border color when focused and valid.
  let color: Color
  /// The text color when not focused.
  let textColor: Color
  /// The text color when focused.
  let enabledTextColor: Color
  /// The background color of the text editor.
  let backgroundColor: Color
  /// The color used for validation errors.
  let validationColor: Color
  /// The width of the border stroke.
  let borderWidth: CGFloat
  /// The minimum height of the text editor.
  let minHeight: CGFloat
  /// The maximum height of the text editor. When nil, there is no maximum height limit.
  let maxHeight: CGFloat?
  /// The corner radius of the text editor.
  let cornerRadius: CGFloat

  /// Creates a bordered text editor theme configuration.
  ///
  /// - Parameters:
  ///   - color: The focused border color (default is `.blue`).
  ///   - textColor: The unfocused text color (default is `.gray`).
  ///   - enabledTextColor: The focused text color (default is `.black`).
  ///   - backgroundColor: The background color (default is `.white`).
  ///   - validationColor: The validation error color (default is `.red`).
  ///   - borderWidth: The border stroke width (default is `.borderWidthPrimary`).
  ///   - minHeight: The minimum text editor height (default is `.textEditorMinHeight`).
  ///   - maxHeight: The maximum text editor height (default is `nil`, no limit).
  ///   - cornerRadius: The corner radius (default is `.radius150`).
  public init(
    color: Color = .blue,
    textColor: Color = .gray,
    enabledTextColor: Color = .black,
    backgroundColor: Color = .white,
    validationColor: Color = .red,
    borderWidth: CGFloat = .borderWidthPrimary,
    minHeight: CGFloat = .textEditorMinHeight,
    maxHeight: CGFloat? = nil,
    cornerRadius: CGFloat = .radius150
  ) {
    self.color = color
    self.textColor = textColor
    self.enabledTextColor = enabledTextColor
    self.backgroundColor = backgroundColor
    self.validationColor = validationColor
    self.borderWidth = borderWidth
    self.minHeight = minHeight
    self.maxHeight = maxHeight
    self.cornerRadius = cornerRadius
  }
}

public extension CGFloat {
  /// Minimum height for text editor components.
  /// Value: 120.0
  static let textEditorMinHeight = 120.0
}
