import SwiftUI
import Common

public struct BackpackView: View {
    var backpackRouter: BackpackRouter
    
    public init(backpackRouter: BackpackRouter) {
        self.backpackRouter = backpackRouter
    }
    
    public var body: some View {
        VStack {
            Spacer()
            Text("How many Pokemons do we have?")
            Spacer()
            Button("Show detail") {
                self.backpackRouter.showDetails()
            }
            Spacer()
            
            Button("Catch Another Pokemon") {
                self.backpackRouter.showCatch()
            }
        }
        .padding()
    }
}

struct BackpackView_Previews: PreviewProvider {
    static var previews: some View {
        BackpackView(backpackRouter: BackpackRouter(with: AppRouter(with: NavigationPath())))
    }
}
