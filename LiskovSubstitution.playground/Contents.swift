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

class Airplane: Vehicle {
    override func canfly() -> Bool {
        return true
    }
}

class Car: Vehicle { }

class Handler {
    static func speedDescription(for vehicle: Vehicle) -> String {
        if vehicle.canfly() {
            return "It flys at \(vehicle.speed) knot "
        } else {
            return "Runs at \(vehicle.speed) kph"
        }
    }
}

let car = Car(name: "BMW", speed: 180.00, wheels: 4)
let plane = Airplane(name: "KLM", speed: 34.00, wheels: 3)
///Based on Liskov Handler should always be able to
///Process speedDescription when given any type of Vehicle
let carSpeedDescription = Handler.speedDescription(for: car)
let planeSpeedDescription = Handler.speedDescription(for: plane)
