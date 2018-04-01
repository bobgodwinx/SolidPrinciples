//: SOLID Principles

import Foundation
import PlaygroundSupport

//MARK: Liskov Substitution

class Vehicle {
    let name: String
    let speed: Double
    let wheels: Int

    init(name: String, speed: Double, wheels: Int) {
        self.name = name
        self.speed = speed
        self.wheels = wheels
    }

    func canfly() -> Bool {
        return false
    }
}
