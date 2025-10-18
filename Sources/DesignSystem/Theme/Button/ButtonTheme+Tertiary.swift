import SwiftUI

extension ButtonTheme {
  public struct Tertiary {
    let baseColor: Color
    let disabledBaseColor: Color
    let pressedOpacity: Double
    let minHeight: CGFloat
    let maxWidth: CGFloat?
    let horizontalPadding: CGFloat
    let font: Font

    public init(
      baseColor: Color = .blue,
      disabledBaseColor: Color = .gray,
      pressedOpacity: Double = 0.7,
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
