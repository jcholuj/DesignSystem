import SwiftUI

extension ButtonTheme {
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

    public init(
      baseColor: Color = .blue,
      textColor: Color = .white,
      disabledBaseColor: Color = .gray.opacity(0.3),
      disabledTextColor: Color = .gray,
      pressedOpacity: Double = 0.7,
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
