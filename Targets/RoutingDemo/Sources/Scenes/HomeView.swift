import SwiftUI
import Common

struct HomeView: View {
    var homeRouter: HomeRouter
    
    init(homeRouter: HomeRouter) {
        self.homeRouter = homeRouter
    }
    
    var body: some View {
        VStack {
            Spacer()
            Button("Catch") {
                showCatchScene()
            }
            Spacer()
            Button("Backpack") {
                showBackpackScene()
            }
            Spacer()
        }.navigationTitle("Pokedex")
    }
    
    func showCatchScene() {
        homeRouter.showCatchScene()
    }
    
    func showBackpackScene() {
        homeRouter.showBackpackScene()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(homeRouter: HomeRouter(with: AppRouter(with: NavigationPath())))
    }
}
