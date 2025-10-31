import SwiftUI

public extension EnvironmentValues {
  @Entry var borderedTextFieldTheme: BorderedTextFieldTheme = .init()
}

@Observable
public final class BorderedTextFieldTheme {
  let color: Color
  let textColor: Color
  let enabledTextColor: Color
  let backgroundColor: Color
  let validationColor: Color
  let borderWidth: CGFloat
  let height: CGFloat
  let cornerRadius: CGFloat
  let animation: Animation
  let clearButtonIcon: Image?

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
