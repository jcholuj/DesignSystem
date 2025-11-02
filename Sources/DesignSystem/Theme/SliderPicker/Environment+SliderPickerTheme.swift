import SwiftUI

public extension EnvironmentValues {
  /// The slider picker theme for the current environment.
  ///
  /// Use this to customize the appearance of SliderPicker components.
  @Entry var sliderPickerTheme: SliderPickerTheme = .init()
}

/// A theme configuration for SliderPicker components.
///
/// `SliderPickerTheme` provides comprehensive styling options for slider pickers,
/// including colors, sizing, and animations for smooth interactions.
///
/// ## Basic Usage
///
/// ```swift
/// let customTheme = SliderPickerTheme(
///     color: .purple,
///     backgroundColor: .gray.opacity(0.2),
///     height: .spacing500,
///     cornerRadius: .radius250
/// )
///
/// SliderPicker(selection: $value, steps: 10)
///     .environment(\.sliderPickerTheme, customTheme)
/// ```
///
/// ## Multiple Pickers with Different Themes
///
/// ```swift
/// VStack {
///     SliderPicker(selection: $value1, steps: 10)
///         .environment(\.sliderPickerTheme, SliderPickerTheme(color: .green))
///
///     SliderPicker(selection: $value2, steps: 10)
///         .environment(\.sliderPickerTheme, SliderPickerTheme(color: .orange))
/// }
/// ```
///
@Observable
public final class SliderPickerTheme {
  /// The color of the selection indicator and selected label.
  let color: Color
  /// The background color of the slider track.
  let backgroundColor: Color
  /// The color of the divider lines between steps.
  let dividerColor: Color
  /// The height of the slider track.
  let height: CGFloat
  /// The corner radius of the slider track.
  let cornerRadius: CGFloat
  /// The animation used for selection transitions.
  let animation: Animation

  /// Creates a slider picker theme configuration.
  ///
  /// - Parameters:
  ///   - color: The selection indicator and label color (default is `.blue`).
  ///   - backgroundColor: The track background color (default is gray with 20% opacity).
  ///   - dividerColor: The divider line color (default is gray with 50% opacity).
  ///   - height: The track height (default is `.spacing300`).
  ///   - cornerRadius: The corner radius (default is `.radius150`).
  ///   - animation: The selection animation (default is `.bouncyDefault`).
  public init(
    color: Color = .blue,
    backgroundColor: Color = .gray.opacity(0.2),
    dividerColor: Color = .gray.opacity(0.5),
    height: CGFloat = .spacing300,
    cornerRadius: CGFloat = .radius150,
    animation: Animation = .bouncyDefault
  ) {
    self.color = color
    self.backgroundColor = backgroundColor
    self.dividerColor = dividerColor
    self.height = height
    self.cornerRadius = cornerRadius
    self.animation = animation
  }
}
