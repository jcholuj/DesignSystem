import SwiftUI

extension ButtonTheme {
  /// Configuration for primary button styling.
  ///
  /// Defines the visual properties of filled primary buttons including colors,
  /// sizing, typography, and interaction states.
  public struct Primary {
    let baseColor: Color
    let textColor: Color
    let disabledBaseColor: Color
    let disabledTextColor: Color
    let pressedOpacity: Double
    let minHeight: CGFloat
    let maxWidth: CGFloat?
    let horizontalPadding: CGFloat
    let cornerRadius: CGFloat
    let font: Font

    /// Creates a primary button configuration.
    ///
    /// - Parameters:
    ///   - baseColor: The background color (default is `.blue`).
    ///   - textColor: The text color (default is `.white`).
    ///   - disabledBaseColor: The background color when disabled (default is gray with 30% opacity).
    ///   - disabledTextColor: The text color when disabled (default is `.gray`).
    ///   - pressedOpacity: The opacity when pressed (default is `.pressedOpacity`).
    ///   - minHeight: The minimum height (default is `.spacing600`).
    ///   - maxWidth: The maximum width (default is `.infinity`).
    ///   - horizontalPadding: The horizontal padding (default is `.spacing200`).
    ///   - cornerRadius: The corner radius (default is `.radius150`).
    ///   - font: The font (default is `.headline.weight(.semibold)`).
    public init(
      baseColor: Color = .blue,
      textColor: Color = .white,
      disabledBaseColor: Color = .gray.opacity(0.3),
      disabledTextColor: Color = .gray,
      pressedOpacity: Double = .pressedOpacity,
      minHeight: CGFloat = .spacing600,
      maxWidth: CGFloat? = .infinity,
      horizontalPadding: CGFloat = .spacing200,
      cornerRadius: CGFloat = .radius150,
      font: Font = .headline.weight(.semibold)
    ) {
      self.baseColor = baseColor
      self.textColor = textColor
      self.disabledBaseColor = disabledBaseColor
      self.disabledTextColor = disabledTextColor
      self.pressedOpacity = pressedOpacity
      self.minHeight = minHeight
      self.maxWidth = maxWidth
      self.horizontalPadding = horizontalPadding
      self.cornerRadius = cornerRadius
      self.font = font
    }
  }
}
