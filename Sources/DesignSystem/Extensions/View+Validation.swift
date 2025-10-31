import SwiftUI

public enum ValidationOption: CaseIterable {
  case onChange
  case onSubmit
}

public extension View {
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
