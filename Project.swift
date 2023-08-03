import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.app(name: "RoutingDemo",
                          platform: .iOS,
                          moduleTargets: [
                            makeCatchModule(),
                            makeBackpackModule(),
                            makeCommonModule()])

func makeCatchModule() -> Module {
    return Module(name: "Catch",
                  path: "Catch",
                  dependancies: [.target(name: "Common")],
                  resources: ["Resources/**"],
                  targets: [.framework, .unitTests])
}

func makeBackpackModule() -> Module {
    return Module(name: "Backpack",
                  path: "Backpack",
                  dependancies: [.target(name: "Common")],
                  resources: ["Resources/**"],
                  targets: [.framework, .unitTests])
}

func makeCommonModule() -> Module {
    return Module(name: "Common",
                  path: "Common",
                  dependancies: [],
                  resources: [],
                  targets: [.framework])
}
