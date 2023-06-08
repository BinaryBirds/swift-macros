# SwiftMacros

🚧 A collection of useful macro definitions for Swift. (WIP)


## Getting started

Just use the following dependency to your project.

```swift
.package(url: "https://github.com/binarybirds/swift-macros", branch: "main"),
```

Don't forget to add the `SwiftMacros` product to your target.
```
.product(name: "SwiftMacros", package: "swift-macros"),
```

## Useful macros

### Init

Generates a public init for objects.

```swift
import Foundation
import SwiftMacros

@Init
public struct Something: Codable {
    let foo: String
    let bar: Int
    let hello: Bool?

}
```

That's all for now.
