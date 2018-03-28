//: SOLID Principles

import Foundation
import PlaygroundSupport

//MARK: Open Closed

protocol Developer {
    var language: String {get}
    func traits() -> String
}

