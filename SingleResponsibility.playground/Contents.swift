//: SOLID Principles

import Foundation

//MARK: Single Responsibility

/// Mutates a given state
protocol Switchable {
    func on()
    func off()
}
// Executes a function
protocol Executable {
    func execute()
}