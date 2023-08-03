import SwiftUI
import Common

// Enum for internal routes
enum BackpackRoute: Hashable {
    case details
}

// Enum for external routes (exits from this module)
enum BackpackExit: Hashable {
    case home
}

// The module router
public class BackpackRouter: ModuleRouter {
    public var appRouter: AppRouter

    public init(with appRouter: AppRouter) {
        self.appRouter = appRouter
    }

    func navigate(to target: BackpackRoute) {
        appRouter.navigate(to: target)
    }

    func pop() {
        appRouter.pop()
    }
    
    func showDetails() {
        navigate(to: .details)
    }
}
