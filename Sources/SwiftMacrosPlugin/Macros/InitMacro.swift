import SwiftSyntax
import SwiftSyntaxMacros

public struct InitMacro: MemberMacro {
    
    public static func expansion<Declaration, Context>(
        of node: AttributeSyntax,
        providingMembersOf declaration: Declaration,
        in context: Context
    ) throws -> [SwiftSyntax.DeclSyntax] where Declaration : DeclGroupSyntax, Context : MacroExpansionContext {

        let members = declaration.memberBlock.members
        
        var props: [(name: String, type: String)] = []
        for member in members {
            guard
                let v = member.decl.as(VariableDeclSyntax.self),
                let b = v.bindings.first,
                let i = b.pattern.as(IdentifierPatternSyntax.self),
                let t = b.typeAnnotation?.type
            else {
                continue
            }
            let n = i.identifier.text
            let tv = t.description
           
            props.append((name: n, type: tv))
        }

        let parameters = props
            .map { "\($0.name): \($0.type)"}
            .joined(separator: ",\n")
        
        let assignments = props
            .map { "self.\($0.name) = \($0.name)"}
            .joined(separator: "\n")
        
        return [
            """
            public init(
                \(raw: parameters)
            ) {
                \(raw: assignments)
            }
            """
        ]
    }
}
