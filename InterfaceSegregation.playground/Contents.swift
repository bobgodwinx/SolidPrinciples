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
    case mandarin, english, deutsche, italian, latin, spanish, french
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
