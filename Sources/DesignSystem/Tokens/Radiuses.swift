import Foundation

/// Design tokens for consistent corner radius values throughout the application.
///
/// These radius values follow a systematic scale from 2pt to 24pt,
/// providing consistent rounded corners across all UI components.
///
/// ## Usage
///
/// ```swift
/// RoundedRectangle(cornerRadius: .radius150)
///     .fill(.blue)
///
/// Text("Button")
///     .padding()
///     .background(
///         RoundedRectangle(cornerRadius: .radius200)
///             .fill(.blue)
///     )
/// ```
///
/// ## Scale
///
/// The radius scale uses a naming convention where the number represents
/// the size step (e.g., radius100 = 8pt, radius150 = 12pt, radius200 = 16pt).
///
public extension CGFloat {
  /// Value: 2.0
  static let radius25 = 2.0
  /// Value: 4.0
  static let radius50 = 4.0
  /// Value: 6.0
  static let radius75 = 6.0
  /// Value: 8.0
  static let radius100 = 8.0
  /// Value: 10.0
  static let radius125 = 10.0
  /// Value: 12.0
  static let radius150 = 12.0
  /// Value: 16.0
  static let radius200 = 16.0
  /// Value: 20.0
  static let radius250 = 20.0
  /// Value: 24.0
  static let radius300 = 24.0
}
