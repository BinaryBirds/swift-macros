import XCTest
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftMacrosPlugin

final class SwiftMacrosTests: XCTestCase {

    let testMacros: [String: Macro.Type] = [
        "Init": InitMacro.self,
    ]

    func testInitMacro() throws {

        let sf: SourceFileSyntax = """
        @Init
        public struct Something: Codable {
            let foo: String
            let bar: Int
            let hello: Bool?
        }
        """
        
        let expectation = """
        
        public struct Something: Codable {
            let foo: String
            let bar: Int
            let hello: Bool?
            public init(
                foo: String,
            bar: Int,
            hello: Bool?
            ) {
                self.foo = foo
            self.bar = bar
            self.hello = hello
            }
        }
        """

        let context = BasicMacroExpansionContext(
            sourceFiles: [
                sf: .init(
                    moduleName: "TestModule",
                    fullFilePath: "test.swift"
                )
            ]
        )

        let transformed = sf.expand(macros: testMacros, in: context)
        XCTAssertEqual(transformed.formatted().description, expectation)
    }
}
