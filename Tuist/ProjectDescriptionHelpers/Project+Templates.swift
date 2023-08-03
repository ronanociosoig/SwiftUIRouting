import ProjectDescription

public enum uFeatureTarget {
    case framework
    case unitTests
}

public struct Module {
    let name: String
    let dependancies: [TargetDependency]
    let resources: [String]
    let targets: Set<uFeatureTarget>
    
    public init(name: String,
                path: String,
                dependancies: [TargetDependency],
                resources: [String],
                targets: Set<uFeatureTarget> = Set([.framework, .unitTests])) {
        self.name = name
        self.dependancies = dependancies
        self.resources = resources
        self.targets = targets
    }
}


extension Project {
    /// Helper function to create the Project for this ExampleApp
    public static func app(name: String,
                           platform: Platform,
                           moduleTargets: [Module]) -> Project {
        
        var dependencies = moduleTargets.map { TargetDependency.target(name: $0.name) }
        var targets = makeAppTargets(name: name,
                                     platform: platform,
                                     dependencies: dependencies)
        
        targets += moduleTargets.flatMap({ makeFrameworkTargets(module: $0, platform: platform) })
        
        return Project(name: name,
                       organizationName: "tuist.io",
                       targets: targets)
    }

    // MARK: - Private

    /// Helper function to create a framework target and an associated unit test target
    private static func makeFrameworkTargets(module: Module, platform: Platform) -> [Target] {
        let sources = Target(name: module.name,
                platform: platform,
                product: .framework,
                bundleId: "io.tuist.\(module.name)",
                infoPlist: .default,
                sources: ["Targets/\(module.name)/Sources/**"],
                resources: [],
                dependencies: module.dependancies)
        let tests = Target(name: "\(module.name)Tests",
                platform: platform,
                product: .unitTests,
                bundleId: "io.tuist.\(module.name)Tests",
                infoPlist: .default,
                sources: ["Targets/\(module.name)/Tests/**"],
                resources: [],
                dependencies: [.target(name: module.name)])
        return [sources, tests]
    }

    /// Helper function to create the application target and the unit test target.
    private static func makeAppTargets(name: String, platform: Platform, dependencies: [TargetDependency]) -> [Target] {
        let platform: Platform = platform
        let infoPlist: [String: InfoPlist.Value] = [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1",
"UIMainStoryboardFile": "",
            "UILaunchStoryboardName": "LaunchScreen"
            ]

        let mainTarget = Target(
            name: name,
            platform: platform,
            product: .app,
            bundleId: "io.tuist.\(name)",
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Targets/\(name)/Sources/**"],
            resources: ["Targets/\(name)/Resources/**"],
            dependencies: dependencies
        )

        let testTarget = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "io.tuist.\(name)Tests",
            infoPlist: .default,
            sources: ["Targets/\(name)/Tests/**"],
            dependencies: [
                .target(name: "\(name)")
        ])
        return [mainTarget, testTarget]
    }
}
