//: SOLID Principles

import Foundation
import PlaygroundSupport

//MARK: Open Closed

protocol Developer {
    var language: String {get}
    func traits() -> String
}

//MARK: Concrete Types
struct WebProgrammer { }
struct RubyArchitect { }
class IOSEngineer { }
//MARk: Extension for language
extension IOSEngineer: Developer {
    var language: String {  return "Objective-C" }
}
extension WebProgrammer: Developer {
    var language: String { return "HTML" }
}
extension RubyArchitect: Developer {
    var language: String { return "Ruby" }
}
extension Developer {
    var iosTraits: String {
        return "The iOS developer use both \(self.language) and now Swift"
    }
}

