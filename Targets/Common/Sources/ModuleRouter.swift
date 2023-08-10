import Foundation

public protocol ModuleRouter {
    var appRouter: AppRouter { get }
}

public enum ModuleExit: Hashable {
    case showCatch
    case showBackpack
}
