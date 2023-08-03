import SwiftUI

public extension View {
    func withBackpackRoutes() -> some View {
        self.navigationDestination(for: BackpackRoute.self) { destination in
            switch destination {
                // Handle navigation logic for each route of this module
                case .details:
                    DetailView()
            }
        }
    }
}
