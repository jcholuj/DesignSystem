import SwiftUI

extension ButtonTheme {
  /// Configuration for tertiary button styling.
  ///
  /// Defines the visual properties of text-only tertiary buttons including
  /// colors, sizing, typography, and interaction states.
  public struct Tertiary {
    let baseColor: Color
    let disabledBaseColor: Color
    let pressedOpacity: Double
    let minHeight: CGFloat
    let maxWidth: CGFloat?
    let horizontalPadding: CGFloat
    let font: Font

    /// Creates a tertiary button configuration.
    ///
    /// - Parameters:
    ///   - baseColor: The text color (default is `.blue`).
    ///   - disabledBaseColor: The text color when disabled (default is `.gray`).
    ///   - pressedOpacity: The opacity when pressed (default is `.pressedOpacity`).
    ///   - minHeight: The minimum height (default is `.spacing600`).
    ///   - maxWidth: The maximum width (default is `.infinity`).
    ///   - horizontalPadding: The horizontal padding (default is `.spacing200`).
    ///   - font: The font (default is `.headline.weight(.semibold)`).
    public init(
      baseColor: Color = .blue,
      disabledBaseColor: Color = .gray,
      pressedOpacity: Double = .pressedOpacity,
      minHeight: CGFloat = .spacing600,
      maxWidth: CGFloat? = .infinity,
      horizontalPadding: CGFloat = .spacing200,
      font: Font = .headline.weight(.semibold)
    ) {
      self.baseColor = baseColor
      self.disabledBaseColor = disabledBaseColor
      self.pressedOpacity = pressedOpacity
      self.minHeight = minHeight
      self.maxWidth = maxWidth
      self.horizontalPadding = horizontalPadding
      self.font = font
    }
  }
}
