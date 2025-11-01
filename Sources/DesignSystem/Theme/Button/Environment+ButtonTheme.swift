import SwiftUI

public extension EnvironmentValues {
  /// The button theme for the current environment.
  ///
  /// Use this to customize button appearance across your app or specific views.
  @Entry var buttonTheme: ButtonTheme = .init()
}

/// A theme configuration for button styles in the design system.
///
/// `ButtonTheme` provides centralized styling for all three button variants:
/// primary (filled), secondary (outlined), and tertiary (text-only).
///
/// ## Basic Usage
///
/// ```swift
/// let customTheme = ButtonTheme(
///     primary: .init(baseColor: .green),
///     secondary: .init(baseColor: .green),
///     tertiary: .init(baseColor: .green)
/// )
///
/// VStack {
///     Button("Primary") { }
///         .buttonStyle(.primary)
///     Button("Secondary") { }
///         .buttonStyle(.secondary)
///     Button("Tertiary") { }
///         .buttonStyle(.tertiary)
/// }
/// .environment(\.buttonTheme, customTheme)
/// ```
///
@Observable
public final class ButtonTheme {
  /// Configuration for primary button style.
  let primary: Primary
  /// Configuration for secondary button style.
  let secondary: Secondary
  /// Configuration for tertiary button style.
  let tertiary: Tertiary

  /// Creates a button theme with customizable primary, secondary, and tertiary configurations.
  ///
  /// - Parameters:
  ///   - primary: The primary button configuration (default is `.init()`).
  ///   - secondary: The secondary button configuration (default is `.init()`).
  ///   - tertiary: The tertiary button configuration (default is `.init()`).
  public init(
    primary: Primary = .init(),
    secondary: Secondary = .init(),
    tertiary: Tertiary = .init()
  ) {
    self.primary = primary
    self.secondary = secondary
    self.tertiary = tertiary
  }
}
