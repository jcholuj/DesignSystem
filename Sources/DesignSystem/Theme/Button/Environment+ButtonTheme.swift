import SwiftUI

public extension EnvironmentValues {
  @Entry var buttonTheme: ButtonTheme = .init()
}

@Observable
public final class ButtonTheme {
  let primary: Primary
  let secondary: Secondary
  let tertiary: Tertiary

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
