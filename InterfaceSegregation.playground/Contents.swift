//: SOLID Principles

import Foundation
import PlaygroundSupport

//MARK: Interface Segregation

enum Continent {
    case africa, europe, asia, america
}

enum Union {
    case EU, AU, CAU, NAU, UNASUR
}

enum Language {
    case mandarin, english, deutsche, italian, latin, spanish, french, portuguese, welsh, scots, irish, cornish
}

enum Ethnic {
    case caucasian(percentage: Float)
    case black(percentage: Float)
    case asian(percentage: Float)
    case mixed(percentage: Float)
    case others(percentage: Float)
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
    var population: Double {get}
}
/// Interface 2 = Community
protocol Community {
    var member: Union {get}
}
/// Interface 3 = Lingua
protocol Lingua {
    var officialLanguage: Language {get}
    var otherLanguages: [Language] {get}
}
/// Inetrface 4 = Ethnicity
protocol Ethnicity {
    var ethnicGroups: [Ethnic] {get}
}
/// description on `Union`
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
/// `State` conforms to `Lingua`
extension State: Lingua {
    var officialLanguage: Language {
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

    var otherLanguages: [Language] {
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
///`Country` conforming to `Ethnicity`
extension Ethnicity where Self: Country {
    //Please note that this is just an exmaple
    //do not hold me responsible for incorrect data
    //use it and see it as example please!!!!!!!!
    var ethnicGroups: [Ethnic] {
        return self.states.reduce([]) { groups, state -> [Ethnic] in
            var _ethnicGroups = groups
            switch state {
            case .scotland, .wales, .england, .northernIreland:
                let caucasian = Ethnic.caucasian(percentage: 81.9)
                let black = Ethnic.black(percentage: 13)
                let asian = Ethnic.asian(percentage: 8.0)
                let others = Ethnic.others(percentage: 3.0)
                let _groups = [caucasian, black, asian, others]
                _ethnicGroups.append(contentsOf: _groups)
            case .italy:
                let caucasian = Ethnic.caucasian(percentage: 92.9)
                let black = Ethnic.black(percentage: 0.8)
                let asian = Ethnic.asian(percentage: 2.2)
                let others = Ethnic.others(percentage: 7.0)
                let _groups = [caucasian, black, asian, others]
                _ethnicGroups.append(contentsOf: _groups)
            case .china:
                let caucasian = Ethnic.caucasian(percentage: 4.9)
                let black = Ethnic.black(percentage: 0.1)
                let asian = Ethnic.asian(percentage: 90.2)
                let others = Ethnic.others(percentage: 5.0)
                let _groups = [caucasian, black, asian, others]
                _ethnicGroups.append(contentsOf: _groups)
            case .germany:
                let caucasian = Ethnic.caucasian(percentage: 91.5)
                let black = Ethnic.black(percentage: 1.1)
                let asian = Ethnic.asian(percentage: 1.2)
                let others = Ethnic.others(percentage: 6.2)
                let _groups = [caucasian, black, asian, others]
                _ethnicGroups.append(contentsOf: _groups)
            case .brazil:
                let caucasian = Ethnic.caucasian(percentage: 47.7)
                let black = Ethnic.black(percentage: 7.6)
                let asian = Ethnic.asian(percentage: 1.2)
                let mixed = Ethnic.mixed(percentage: 43.1)
                let others = Ethnic.others(percentage: 0.4)
                let _groups = [caucasian, black, asian, others, mixed]
                _ethnicGroups.append(contentsOf: _groups)
            case .nigeria:
                let caucasian = Ethnic.caucasian(percentage: 0.6)
                let black = Ethnic.black(percentage: 95.6)
                let asian = Ethnic.asian(percentage: 0.4)
                let others = Ethnic.others(percentage: 3.4)
                let _groups = [caucasian, black, asian, others]
                _ethnicGroups.append(contentsOf: _groups)
            case .USA:
                let caucasian = Ethnic.caucasian(percentage: 61.3)
                let black = Ethnic.black(percentage: 12.6)
                let asian = Ethnic.asian(percentage: 5.6)
                let others = Ethnic.others(percentage: 20.5)
                let _groups = [caucasian, black, asian, others]
                _ethnicGroups.append(contentsOf: _groups)
            case .southAfrica:
                let caucasian = Ethnic.caucasian(percentage: 8.9)
                let black = Ethnic.black(percentage: 79.2)
                let asian = Ethnic.asian(percentage: 2.5)
                let others = Ethnic.others(percentage: 7.5)
                let _groups = [caucasian, black, asian, others]
                _ethnicGroups.append(contentsOf: _groups)
            }
            return _ethnicGroups
        }
    }
}
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

///Example 1 china
let china = State.china(continent: .asia)
let PRC = Nation(name: "People's Republic of China",
                 states: [china],
                 population: 1379000000,
                 officialLanguage: .mandarin,
                 member: .CAU)
PRC.name
PRC.officialLanguage
PRC.otherLanguages
PRC.ethnicGroups
PRC.member.description
