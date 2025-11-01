import SwiftUI

public extension Label where Title == Text, Icon == Image {
  /// Creates an error label with an exclamation mark icon.
  ///
  /// Convenient initializer for creating error labels with consistent iconography.
  ///
  /// ## Example
  ///
  /// ```swift
  /// Label(errorMessage: "Invalid email address")
  ///     .labelStyle(.error)
  /// ```
  ///
  /// - Parameter errorMessage: The error message text to display.
  init(errorMessage: String) {
    self.init(
      title: { Text(errorMessage) },
      icon: { Image(systemName: "exclamationmark.circle") }
    )
  }
}

public extension LabelStyle where Self == ErrorLabelStyle {
  /// An error label style with default red color.
  static var error: Self { .init() }

  /// An error label style with custom color.
  ///
  /// - Parameter color: The color to use for the error label.
  static func error(color: Color) -> Self {
    .init(color: color)
  }
}

/// A label style designed for displaying error messages with an icon.
///
/// `ErrorLabelStyle` presents error messages with a small font, icon, and colored text,
/// making validation errors easily noticeable.
///
/// ## Basic Usage
///
/// ```swift
/// Label(errorMessage: "Required field")
///     .labelStyle(.error)
/// ```
///
/// ## Custom Color
///
/// ```swift
/// Label(errorMessage: "Warning message")
///     .labelStyle(.error(color: .orange))
/// ```
///
public struct ErrorLabelStyle: LabelStyle {
  private let color: Color

  /// Creates an error label style with a specified color.
  ///
  /// - Parameter color: The color to apply to the label (default is `.red`).
  public init(color: Color = .red) {
    self.color = color
  }

  public func makeBody(configuration: Configuration) -> some View {
    HStack(spacing: .spacing75) {
      configuration.icon

      configuration.title
    }
    .foregroundStyle(Color.red)
    .font(.footnote.weight(.semibold))
  }
}

#if DEBUG
#Preview {
  Label(errorMessage: "Something went wrong.")
    .labelStyle(.error)
}
#endif
