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

