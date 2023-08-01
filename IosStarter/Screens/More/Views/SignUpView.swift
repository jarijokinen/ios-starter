import SwiftUI

struct SignUpView: View {
  @Bindable private var vm = AccountViewModel()
  
  var body: some View {
    VStack {
      TextField("Email...", text: $vm.email)
        .textFieldStyle(.roundedBorder)
        .textInputAutocapitalization(.never)
        .keyboardType(.emailAddress)
      
      SecureField("Password...", text: $vm.password)
        .textFieldStyle(.roundedBorder)
      
      if let err = vm.error {
        Text(err).foregroundStyle(.red).padding()
      }
      
      Button { vm.signUp() } label: {
        Text("Sign Up")
          .buttonStyle(.borderedProminent)
      }
    }
    .padding()
    .navigationTitle("Sign Up")
  }
}
