import SwiftUI

/// Options for when validation should be triggered.
public enum ValidationOption: CaseIterable {
  /// Trigger validation when the value changes.
  case onChange
  /// Trigger validation when the form is submitted.
  case onSubmit
}

public extension View {
  /// Attaches validation behavior to a view based on a validation state.
  ///
  /// This modifier monitors a `ValidationState` and triggers validation either when the value changes,
  /// when the form is submitted, or both, based on the specified options.
  ///
  /// ## Example
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
  /// ## Validation Options
  ///
  /// ```swift
  /// // Validate only on change
  /// .validate(state, validationOptions: [.onChange]) { errorMessage = $0 }
  ///
  /// // Validate only on submit
  /// .validate(state, validationOptions: [.onSubmit]) { errorMessage = $0 }
  ///
  /// // Validate on both (default)
  /// .validate(state) { errorMessage = $0 }
  /// ```
  ///
  /// - Parameters:
  ///   - state: The validation state containing the value and validator function.
  ///   - validationOptions: When to trigger validation (default is both onChange and onSubmit).
  ///   - onValidation: Closure called with the validation result (nil if valid, error message if invalid).
  ///
  /// - Returns: A view that performs validation based on the specified options.
  func validate<Value: Equatable>(
    _ state: ValidationState<Value>,
    validationOptions: [ValidationOption] = ValidationOption.allCases,
    onValidation: @escaping (String?) -> Void
  ) -> some View {
    self
      .apply(if: validationOptions.contains(.onChange)) {
        $0
          .onChange(of: state.value) { _, newValue in
            onValidation(state.validate(newValue))
          }
      }
      .apply(if: validationOptions.contains(.onSubmit)) {
        $0
          .onSubmit { onValidation(state.validate()) }
      }
  }
}
