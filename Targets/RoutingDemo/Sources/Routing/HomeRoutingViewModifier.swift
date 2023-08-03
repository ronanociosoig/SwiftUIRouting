import SwiftUI

public extension View {
    func withHomeRoutes() -> some View {
        self.navigationDestination(for: HomeRoute.self) { _ in
            
        }
    }
}
