import SwiftUI

public extension EnvironmentValues {
  /// The header theme for the current environment.
  ///
  /// Use this to customize header styling in GroupBox components.
  @Entry var headerTheme: HeaderTheme = .init()
}

/// A theme configuration for header-style group boxes.
///
/// `HeaderTheme` provides styling for GroupBox components with emphasized headers,
/// controlling typography, alignment, spacing, and layout.
///
/// ## Basic Usage
///
/// ```swift
/// let customTheme = HeaderTheme(
///     font: .title2.bold(),
///     headerTextColor: .purple,
///     spacing: .spacing200,
///     headerAlignment: .center
/// )
///
/// GroupBox("Section Title") {
///     Text("Content")
/// }
/// .groupBoxStyle(.header)
/// .environment(\.headerTheme, customTheme)
/// ```
///
@Observable
public final class HeaderTheme {
  /// Alignment options for header and content.
  public enum HeaderAlignment {
    /// Align to the leading edge.
    case leading
    /// Center alignment.
    case center
    /// Align to the trailing edge.
    case trailing

    var horiznotalAlignment: HorizontalAlignment {
      switch self {
      case .leading:
          .leading
      case .center:
          .center
      case .trailing:
          .trailing
      }
    }

    var alignment: Alignment {
      switch self {
      case .leading:
          .leading
      case .center:
          .center
      case .trailing:
          .trailing
      }
    }
  }

  /// The font for the header text.
  let font: Font
  /// The color for the header text.
  let headerTextColor: Color
  /// The spacing between header and content.
  let spacing: CGFloat
  /// The alignment for header and content.
  let headerAlignment: HeaderAlignment
  /// The maximum width for the content.
  let maxWidth: CGFloat?

  /// Creates a header theme configuration.
  ///
  /// - Parameters:
  ///   - font: The header font (default is `.headline.weight(.semibold)`).
  ///   - headerTextColor: The header text color (default is `.black`).
  ///   - spacing: The spacing between header and content (default is `.spacing100`).
  ///   - headerAlignment: The alignment (default is `.leading`).
  ///   - maxWidth: The maximum width (default is `.infinity`).
  public init(
    font: Font = .headline.weight(.semibold),
    headerTextColor: Color = .black,
    spacing: CGFloat = .spacing100,
    headerAlignment: HeaderAlignment = .leading,
    maxWidth: CGFloat? = .infinity
  ) {
    self.font = font
    self.headerTextColor = headerTextColor
    self.spacing = spacing
    self.headerAlignment = headerAlignment
    self.maxWidth = maxWidth
  }
}
