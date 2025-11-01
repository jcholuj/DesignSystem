import Foundation

/// A state container for managing form field values with validation logic.
///
/// `ValidationState` combines a value with its validation rules, making it easy to implement
/// form validation in SwiftUI. It stores the current value, error message, and validation logic.
///
/// ## Basic Usage
///
/// ```swift
/// struct ContentView: View {
///     @State private var email = ValidationState(
///         value: "",
///         validator: { value in
///             value.contains("@") ? nil : "Invalid email address"
///         }
///     )
///
///     var body: some View {
///         BorderedTextField(
///             text: $email.value,
///             validationError: $email.errorMessage,
///             prompt: "Email"
///         )
///         .validate(email) { email.errorMessage = $0 }
///     }
/// }
/// ```
///
/// ## Custom Validators
///
/// ```swift
/// // String length validation
/// let username = ValidationState(
///     value: "",
///     validator: { value in
///         value.count >= 3 ? nil : "Username must be at least 3 characters"
///     }
/// )
///
/// // Numeric range validation
/// let age = ValidationState(
///     value: 0,
///     validator: { value in
///         (18...120).contains(value) ? nil : "Age must be between 18 and 120"
///     }
/// )
/// ```
///
public struct ValidationState<Value> {
  /// The current value being validated.
  public var value: Value

  /// The current validation error message, or nil if the value is valid.
  public var errorMessage: String?

  /// The validation function that returns an error message or nil.
  private let validator: (Value) -> String?

  /// Validates the current value.
  ///
  /// - Returns: An error message if validation fails, or nil if valid.
  public func validate() -> String? {
    self.validator(self.value)
  }

  /// Validates a specific value without updating the stored value or error message.
  ///
  /// - Parameter value: The value to validate.
  /// - Returns: An error message if validation fails, or nil if valid.
  public func validate(_ value: Value) -> String? {
    self.validator(value)
  }

  /// Updates the value and validates it, storing the error message.
  ///
  /// - Parameter value: The new value to set and validate.
  public mutating func validate(_ value: Value) {
    self.value = value
    self.errorMessage = self.validator(value)
  }

  /// Creates a validation state with a value and validation logic.
  ///
  /// - Parameters:
  ///   - value: The initial value.
  ///   - errorMessage: An optional initial error message (default is nil).
  ///   - validator: A closure that validates the value and returns an error message or nil.
  public init(
    value: Value,
    errorMessage: String? = nil,
    validator: @escaping (Value) -> String?
  ) {
    self.value = value
    self.errorMessage = errorMessage
    self.validator = validator
  }
}
