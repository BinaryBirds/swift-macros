import Foundation

@attached(member, names: named(init))
public macro Init() = #externalMacro(
    module: "SwiftMacrosPlugin",
    type: "InitMacro"
)
