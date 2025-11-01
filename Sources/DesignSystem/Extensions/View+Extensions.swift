import SwiftUI

public extension View {
  /// Conditionally applies a transformation to a view based on a boolean condition.
  ///
  /// This is a convenient way to apply view modifiers conditionally without breaking the modifier chain.
  ///
  /// ## Example
  ///
  /// ```swift
  /// Text("Hello")
  ///     .apply(if: isHighlighted) {
  ///         $0.bold().foregroundColor(.blue)
  ///     }
  /// ```
  ///
  /// - Parameters:
  ///   - condition: A boolean that determines whether to apply the transformation.
  ///   - transformation: A closure that transforms the view when condition is true.
  ///
  /// - Returns: The transformed view if condition is true, otherwise the original view.
  @ViewBuilder
  func apply<Content: View>(
    if condition: Bool,
    transformation: (Self) -> Content
  ) -> some View {
    if condition {
      transformation(self)
    } else {
      self
    }
  }

  /// Sets both width and height of the view to the same size.
  ///
  /// Convenient shorthand for creating square frames.
  ///
  /// ## Example
  ///
  /// ```swift
  /// Image(systemName: "star")
  ///     .frame(24)
  /// ```
  ///
  /// - Parameter size: The size to apply to both width and height.
  ///
  /// - Returns: A view with the specified square frame.
  func frame(_ size: CGFloat) -> some View {
    self
      .frame(
        width: size,
        height: size
      )
  }

  /// Applies a subtle shadow effect to the view.
  ///
  /// Predefined shadow with 5% black opacity, useful for subtle elevation effects.
  ///
  /// ## Example
  ///
  /// ```swift
  /// RoundedRectangle(cornerRadius: 12)
  ///     .fill(.white)
  ///     .shadow200()
  /// ```
  ///
  /// - Returns: A view with a light shadow applied.
  func shadow200() -> some View {
    self
      .shadow(
        color: Color.black.opacity(0.05),
        radius: .radius100
      )
  }

  /// Applies a medium shadow effect to the view.
  ///
  /// Predefined shadow with 10% black opacity, useful for moderate elevation effects.
  ///
  /// ## Example
  ///
  /// ```swift
  /// RoundedRectangle(cornerRadius: 12)
  ///     .fill(.white)
  ///     .shadow400()
  /// ```
  ///
  /// - Returns: A view with a medium shadow applied.
  func shadow400() -> some View {
    self
      .shadow(
        color: Color.black.opacity(0.10),
        radius: .radius100
      )
  }

  /// Wraps the view in a styled container with padding, background, rounded corners, and optional shadow.
  ///
  /// This is a convenient way to create card-like containers with consistent styling across your app.
  ///
  /// ## Example
  ///
  /// ```swift
  /// Text("Hello, World!")
  ///     .container()
  ///
  /// // Custom styling
  /// VStack {
  ///     Text("Custom Container")
  /// }
  /// .container(
  ///     .spacing300,
  ///     backgroundColor: .blue.opacity(0.1),
  ///     shouldApplyShadow: false
  /// )
  /// ```
  ///
  /// - Parameters:
  ///   - padding: The padding to apply inside the container (default is `.spacing200`).
  ///   - backgroundColor: The background color of the container (default is `.white`).
  ///   - shouldApplyShadow: Whether to apply a subtle shadow effect (default is `true`).
  ///
  /// - Returns: A view wrapped in a styled container.
  @ViewBuilder
  func container(
    _ padding: CGFloat = .spacing200,
    backgroundColor: Color = .white,
    shouldApplyShadow: Bool = true
  ) -> some View {
    self
      .frame(maxWidth: .infinity)
      .padding(padding)
      .background(backgroundColor)
      .clipShape(.rect(cornerRadius: .radius200))
      .apply(if: shouldApplyShadow) {
        $0.shadow200()
      }
  }
}

