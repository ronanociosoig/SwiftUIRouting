import SwiftUI

public class AppRouter: ObservableObject {
    // Restriction: Has to be private to the NavigationStack can bind to it
    @Published public var path: NavigationPath

    public init(with path: NavigationPath) {
        self.path = path
    }

    public func navigate(to destination: any Hashable) {
        path.append(destination)
    }

    public func pop() {
        path.removeLast()
    }
}
