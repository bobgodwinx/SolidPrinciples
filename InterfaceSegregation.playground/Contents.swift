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
    case mandarin, english, deutsche, italian, latin, spanish, french, portuguese, welsh, scots, irish, cornish
}

enum Ethnicity {
    case caucasian, black, asian
}

enum State {
    case italy(continent: Continent)
    case germany(continent: Continent)
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
/// Interface 1 = Country
protocol Country {
    var name: String {get}
    var states: [State] {get}
    var poplation: Double {get}
}
/// Interface 2 = Community
protocol Community {
    var member: Union {get}
}
/// Interface 3 = Lingua
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

extension State: Lingua {
    var official: Language {
        switch self {
        case .brazil:
            return .portuguese
        case .china:
            return .mandarin
        case .germany:
            return .deutsche
        case .italy:
            return .italian
        case .nigeria, .scotland, .wales, .england, .northernIreland, .USA, .southAfrica:
            return .english
        }
    }

    var others: [Language] {
        switch self {
        case .northernIreland:
            return [.irish]
        case .wales:
            return [.welsh]
        case .scotland:
            return [.scots]
        case .italy:
            return [.latin]
        case .england:
            return [.cornish]
        default:
            return []
        }
    }
}

