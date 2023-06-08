#if canImport(SwiftCompilerPlugin)
import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct SwiftMacrosPlugin: CompilerPlugin {
    
    let providingMacros: [Macro.Type] = [
        InitMacro.self,
    ]
}
#endif
