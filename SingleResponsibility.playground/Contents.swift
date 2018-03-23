//: SOLID Principles

import Foundation
import PlaygroundSupport

//MARK: Single Responsibility

/// Mutates a given state
protocol SwitchOn {
    func on()
}

protocol SwitchOff {
    func off()
}

/// Executes a function
protocol Executable {
    func execute()
}
/// Conforms to the `Switchable`
class Switch: SwitchOn, SwitchOff {
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

    private let  aSwitch: SwitchOn

    init(aSwitch: SwitchOn) {
        self.aSwitch = aSwitch
    }

    func execute() {
        //Single Responsibility
        self.aSwitch.on()
    }
}
/// Conforms to `Executable`
class TurnOff: Executable {
    private let  aSwitch: SwitchOff

    init(aSwitch: SwitchOff) {
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

//MARK: Abstract Email Example

protocol Address {
    var to: String {get}
    var from: String {get}
    var carbonCopy: [String] {get}
    var blindCarbonCopy: [String] {get}
}

protocol Content {
    var subject: String {get}
    var messageBody: String {get}
    var attachment: Data {get}
}

protocol Email {
    var address: Address {get}
    var content: Content {get}
}

protocol Sendable {
    func send(message email: Email)
}

class MailServer: Sendable {
    //Single Responsibility
    func send(message email: Email) {
        //sending the email action performed here
    }
}

PlaygroundPage.current.finishExecution()

