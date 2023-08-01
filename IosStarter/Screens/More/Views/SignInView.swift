import SwiftUI

struct SignInView: View {
  @Bindable private var vm = AccountViewModel()
  
  var body: some View {
    NavigationStack {
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
        
        Button { vm.signIn() } label: {
          Text("Sign In")
            .buttonStyle(.borderedProminent)
        }
        
        NavigationLink {
          SignUpView()
        } label: {
          Text("Sign Up")
        }
      }
    }
    .padding()
    .navigationTitle("Sign In")
  }
}
