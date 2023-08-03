import Common

// Enum for internal routes
enum CatchRoute: Hashable {
    case catchOtherScene
}

// Enum for external routes
enum CatchExit: Hashable {
    
}

// The module router
class CatchRouter: ModuleRouter {
    var appRouter: AppRouter

    init(with appRouter: AppRouter) {
        self.appRouter = appRouter
    }

    func navigate(to target: CatchRoute) {
        appRouter.navigate(to: target)
    }

    func pop() {
        appRouter.pop()
    }
}
