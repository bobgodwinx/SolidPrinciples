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
//MARK: Extension for interchangeable algorithms
extension Developer where Self: IOSEngineer {
    func traits() -> String { return iosTraits }
}

extension Developer where Self == WebProgrammer {
    func traits() -> String {
        return "We are cool and we do both \(self.language) and CSS also."
    }
}
///This one is cool :) because it has access to Developer
extension Developer where Self == RubyArchitect {
    func traits() -> String {
        return "Ruby is powerful and we code in \(self.language) and \(self.iosTraits)"
    }
}

