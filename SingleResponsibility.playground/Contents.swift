//: SOLID Principles

import Foundation
import PlaygroundSupport

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
/// Conforms to `Executable`
class TurnOn: Executable {

    private let  aSwitch: Switchable

    init(aSwitch: Switchable) {
        self.aSwitch = aSwitch
    }

    func execute() {
        //Single Responsibility
        self.aSwitch.on()
    }
}
/// Conforms to `Executable`
class TurnOff: Executable {
    private let  aSwitch: Switchable

    init(aSwitch: Switchable) {
        self.aSwitch = aSwitch
    }

    func execute() {
        //Single Responsibility
        self.aSwitch.off()
    }
}

let aSwitch = Switch() /// Represents your model
aSwitch.description
let turnOn = TurnOn(aSwitch: aSwitch) /// Represents a class that has a
turnOn.execute()
aSwitch.description
let turnOff = TurnOff(aSwitch: aSwitch)
turnOff.execute()
aSwitch.description

PlaygroundPage.current.finishExecution()

