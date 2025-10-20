import SwiftUI

public extension EnvironmentValues {
  @Entry var sliderPickerTheme: SliderPickerTheme = .init()
}

@Observable
public final class SliderPickerTheme {
  let color: Color
  let backgroundColor: Color
  let dividerColor: Color
  let height: CGFloat
  let cornerRadius: CGFloat
  let animation: Animation

  public init(
    color: Color = .blue,
    backgroundColor: Color = .gray.opacity(0.2),
    dividerColor: Color = .gray.opacity(0.5),
    height: CGFloat = 24,
    cornerRadius: CGFloat = 12,
    animation: Animation = .bouncy(extraBounce: 0.15)
  ) {
    self.color = color
    self.backgroundColor = backgroundColor
    self.dividerColor = dividerColor
    self.height = height
    self.cornerRadius = cornerRadius
    self.animation = animation
  }
}
