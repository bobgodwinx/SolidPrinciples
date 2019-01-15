# SOLID Principles

This is a Focus on SOLID Principles but from `Swift` point of view. Contributions are welcomed. 

## Contents:
- [Single Responisibility](###Single-Responsibility)
- [Open/Closed](###Open-Closed)
- [Liskov Substitution](###Liskov-Substitution)
- [Interface Segregation](###Interface-Segregation)
- [Dependency Inversion](###Dependency-Inversion)

### Single Responsibility

So the Gang of Four laid the first foundation of OOP design patterns more than 2 decades ago, it’s outdated in my opinion. But it could still be useful when adhering to clean code. This very first principle states that a class should do only one job! Yes this is the meaning of single responsibility and there is no need to sugar coat it. “A class = performs one operation” simple and stupid. 

```swift
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
```
- [Please see complete Single-Responsibility article on medium](https://medium.com/@bobgodwinx/solid-principles-part-1-f3d11b3159f0). <br />
- [The example code is also available on Playground](https://github.com/bobgodwinx/SolidPrinciples/blob/master/SingleResponsibility.playground/Contents.swift)

### Open/Closed

The Open Closed principle enforces a rule that a class can be easily extended but at the same time forbids any modification to it’s self. This principle highly draws it’s traits from the Decorator & Strategy pattern. The Decorator allows extension of behaviour dynamically or statically during runtime. It is often referred to as “the alternative to subclassing”, while the Strategy allows implementation of different algorithms interchangeable within the same family.

```swift
//MARK: Extension for interchangeable algorithms
extension Developer where Self: IOSEngineer {
    func traits() -> String { return iosTraits }
}

extension Developer where Self == WebProgrammer {
    func traits() -> String {
        return "We are cool and we do both \(self.language) and CSS also."
    }
}
```

- [Please see complete Open-Closed article on medium](https://medium.com/@bobgodwinx/solid-principles-part-2-a22d4c8ed906). <br />
- [The example code is also available on Playground](https://github.com/bobgodwinx/SolidPrinciples/blob/master/OpenClosed.playground/Contents.swift)

### Liskov Substitution 

So the Liskov substitution principle states that all derived class should be substitutable for it’s original base class. What this means in practice is that a subclass should always be interchangeable for it’s super class. The main purpose of this principle is to guarantee semantic interoperability within the types hierarchy.

```swift
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
```

- [Please see complete Liskov Substitution article on medium](https://medium.com/@bobgodwinx/solid-principles-part-3-43aad943b056). <br />
- [The example code is also available on Playground](https://github.com/bobgodwinx/SolidPrinciples/blob/master/LiskovSubstitution.playground/Contents.swift)

### Interface Segregation 

The Interface Segregation Principle takes the separation of concerns to a higher level. It states that a client should not be forced to implement or depend on methods that it does not use. In other words it is better to have many specific interfaces than to have a monolitic general purpose interface. The entire purpose of Interface Segregation is to reduce fat interface or what is known as interface pullution, but rather favour code readability and separation of concerns.

```swift
/// Interface 5 = SovereignType
protocol SovereignType: Country, Lingua, Ethnicity, Community {
    init(name: String, states: [State], population: Double, officialLanguage: Language, member: Union)
}
/// A `Nation` confroms to a `SovereignType`
/// you can say that nations are sovereign.. more or less
struct Nation: SovereignType {
    let name: String
    let states: [State]
    let population: Double
    let officialLanguage: Language
    let member: Union

    var otherLanguages: [Language] {
        return states.reduce([]) { languages, state -> [Language] in
            return languages + state.otherLanguages
        }
    }
}
```

- [Please see complete  Interface Segregation  article on medium](https://medium.com/@bobgodwinx/solid-principles-part-4-xxxxxxxxxx). <br />
- [The example code is also available on Playground](https://github.com/bobgodwinx/SolidPrinciples/blob/master/LiskovSubstitution.playground/Contents.swift)

### Dependency Inversion 

Dependency Inversion Principle states that, higher level modules shouldn’t depend on the lower level modules, they should both depend on abstractions. In other words all entities should be based on Abstract Interfaces and not on Concrete Types. The principle also stressed that abstractions should not depend on details. Details should depend upon abstractions. 

So the technical question here is what is a higher level module? or what can we define as a lower level module?

A High level module is any module that contains the policy decisions and business model of an application. This can be regarded as the app identity. The higher level modules are primarily consumed by the presentation layer within an app. 

Low level modules are modules that contains detailed implementation that are required to execute the decisions and business policies.

Dependency Inversion Principle is sometimes mistaken for Dependency Injection. While the terms seems similar to each other, they are totally different. Dependency Injection is the process of giving an object it’s instance properties or variables. However it is difficult to talk about Dependency Inversion Principle without mentioning Dependency Injection. This is because you need Dependency Injection mechanism to realize a  Dependency Inversion
```swift
class PersistenceStore {
    private let store: DefaultsServiceType //Dependency Inversion Principle

    init(store: DefaultsServiceType/*Dependency Inversion Principle*/) {
        self.store = store
    }

    func save(currentGame game: Game) {
        self.store.write(game, forKey: .game)
        }

    func currentGame() -> Game? {
        guard let game: Game = self.store.read(forKey: .game) else { return nil }
        return game
    }
}
```

- [Please see complete  Dependency Inversion  article on medium with full detail implementation and snippets](https://medium.com/@bobgodwinx/solid-principles-part-5-xxxxxxxxxx). <br />
- [The example code is also available on Playground](https://github.com/bobgodwinx/SolidPrinciples/blob/master/DependencyInversion.playground/Contents.swift)


