import Foundation
import SwiftMacros

@Init
public struct Something: Codable {
    let foo: String
    let bar: Int
    let hello: Bool?

}
