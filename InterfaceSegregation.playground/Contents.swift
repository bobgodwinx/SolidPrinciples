//: SOLID Principles

import Foundation
import PlaygroundSupport

//MARK: Interface Segregation

enum Continent: String {
    case africa, europe, asia, america
}

enum Union {
    case EU, AU, CAU, NAU, UNASUR
}

enum Language {
    case mandarin, english, deutsche, italian, latin, spanish, french, Welsh, Scots, Irish, Cornish
}

enum State {
    case italy(continent: Continent)
    case gemany(continent: Continent)
    case southAfrica(continent: Continent)
    case nigeria(continent: Continent)
    case china(continent: Continent)
    case brazil(continent: Continent)
    case USA(continent: Continent)
    case scotland(continent: Continent)
    case england(continent: Continent)
    case wales(continent: Continent)
    case northernIreland(continent: Continent)
}

protocol Country {
    var name: String {get}
    var states: [State] {get}
    var poplation: Double {get}
}

protocol Community {
    var member: Union {get}
}

protocol Lingua {
    var official: Language {get}
    var others: [Language] {get}
}

extension Union {
    var description: String {
        switch self {
        case .AU:
            return "African Union"
        case .CAU:
            return "Central Asian Economic Union"
        case .EU:
            return "European Union"
        case .NAU:
            return "North American Union"
        case .UNASUR:
            return "Union of South American Nations"
        }
    }
}
