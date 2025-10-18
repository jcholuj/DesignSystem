import SwiftUI

extension ButtonTheme {
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

    public init(
      baseColor: Color = .blue,
      disabledBaseColor: Color = .gray,
      borderWidth: CGFloat = 1.5,
      pressedOpacity: Double = 0.7,
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
