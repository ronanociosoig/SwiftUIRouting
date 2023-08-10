import SwiftUI
import Common

enum HomeRoute: Hashable {
    case showHome
}

class HomeRouter: ModuleRouter {
    var appRouter: AppRouter
    
    init(with appRouter: AppRouter) {
        self.appRouter = appRouter
    }
    
    func navigate(to target: HomeRoute) {
        appRouter.navigate(to: target)
    }

    func pop() {
        appRouter.pop()
    }
    
    func showCatchScene() {
        appRouter.navigate(to: ModuleExit.showCatch)
    }
    
    func showBackpackScene() {
        appRouter.navigate(to: ModuleExit.showBackpack)
    }
}
