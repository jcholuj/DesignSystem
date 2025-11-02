import SwiftUI

/// Design tokens for standard animation configurations.
///
/// These animations provide consistent motion and transitions across components.
///
public extension Animation {
  /// Default bouncy animation with slight extra bounce for playful interactions.
  /// Uses extraBounce: 0.15
  static let bouncyDefault = Animation.bouncy(extraBounce: 0.15)
}
