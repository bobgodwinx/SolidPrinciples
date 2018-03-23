//: SOLID Principles

import Foundation

//MARK: Single Responsibility

/// Mutates a given state
protocol Switchable {
    func on()
    func off()
}
/// Executes a function
protocol Executable {
    func execute()
}
/// Conforms to the `Switchable`
class Switch: Switchable {
    private var state: Bool = false

    func on() {
        state = true
    }

    func off() {
        state = false
    }

    var description: String {
        return state ? "Switched On" : "Switched Off"
    }
}
