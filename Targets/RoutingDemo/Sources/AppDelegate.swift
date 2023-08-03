import SwiftUI

import Common
import Backpack
import Catch

// Based on this approach to routing
// https://betterprogramming.pub/modularised-navigation-in-swiftui-an-enum-based-approach-13028acd01ae

@main
struct Application: App {
    @ObservedObject var router: AppRouter
    
    init() {
        self.router = AppRouter(with: NavigationPath())
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                
                HomeView(homeRouter: HomeRouter(with: router))
                    .withHomeRoutes()
                    .withBackpackRoutes()
                    .navigationDestination(for: HomeExit.self) { destination in
                                            switch destination {
                                            case .showCatch:
                                                    CatchView()
                                                case .showBackpack:
                                                BackpackView(backpackRouter: BackpackRouter(with: self.router))
                                            }
                                        }
            }
        }
    }
}
