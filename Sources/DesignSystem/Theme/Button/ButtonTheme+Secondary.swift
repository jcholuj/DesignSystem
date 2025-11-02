import SwiftUI

extension ButtonTheme {
  /// Configuration for secondary button styling.
  ///
  /// Defines the visual properties of outlined secondary buttons including border,
  /// colors, sizing, typography, and interaction states.
  public struct Secondary {
    let baseColor: Color
    let disabledBaseColor: Color
    let borderWidth: CGFloat
    let pressedOpacity: Double
    let minHeight: CGFloat
    let maxWidth: CGFloat?
    let horizontalPadding: CGFloat
    let cornerRadius: CGFloat
    let font: Font

    /// Creates a secondary button configuration.
    ///
    /// - Parameters:
    ///   - baseColor: The border and text color (default is `.blue`).
    ///   - disabledBaseColor: The color when disabled (default is `.gray`).
    ///   - borderWidth: The border stroke width (default is `.borderWidthSecondary`).
    ///   - pressedOpacity: The opacity when pressed (default is `.pressedOpacity`).
    ///   - minHeight: The minimum height (default is `.spacing600`).
    ///   - maxWidth: The maximum width (default is `.infinity`).
    ///   - horizontalPadding: The horizontal padding (default is `.spacing200`).
    ///   - cornerRadius: The corner radius (default is `.radius150`).
    ///   - font: The font (default is `.headline.weight(.semibold)`).
    public init(
      baseColor: Color = .blue,
      disabledBaseColor: Color = .gray,
      borderWidth: CGFloat = .borderWidthSecondary,
      pressedOpacity: Double = .pressedOpacity,
      minHeight: CGFloat = .spacing600,
      maxWidth: CGFloat? = .infinity,
      horizontalPadding: CGFloat = .spacing200,
      cornerRadius: CGFloat = .radius150,
      font: Font = .headline.weight(.semibold)
    ) {
      self.baseColor = baseColor
      self.borderWidth = borderWidth
      self.disabledBaseColor = disabledBaseColor
      self.pressedOpacity = pressedOpacity
      self.minHeight = minHeight
      self.maxWidth = maxWidth
      self.horizontalPadding = horizontalPadding
      self.cornerRadius = cornerRadius
      self.font = font
    }
  }
}
