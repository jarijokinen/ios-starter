import SwiftUI

struct ListView: View {
  @State var vm = ListViewModel()
  
  var body: some View {
    if vm.error == nil {
      List(vm.items) { post in
        Text(post.title)
      }
      .overlay {
        if vm.loading {
          ProgressView("Fetching data...")
        }
      }
      .task {
        await vm.fetchItems()
      }
    } else {
      Text(vm.error ?? "")
    }
  }
}
