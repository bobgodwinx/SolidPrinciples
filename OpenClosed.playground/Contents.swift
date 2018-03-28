//: SOLID Principles

import Foundation
import PlaygroundSupport

//MARK: Open Closed

protocol Developer {
    var language: String {get}
    func traits() -> String
}

//MARK: Concrete Types
struct WebProgrammer { }
struct RubyArchitect { }
class IOSEngineer { }
//MARk: Extension for language
extension IOSEngineer: Developer {
    var language: String {  return "Objective-C" }
}
extension WebProgrammer: Developer {
    var language: String { return "HTML" }
}
extension RubyArchitect: Developer {
    var language: String { return "Ruby" }
}
extension Developer {
    var iosTraits: String {
        return "The iOS developer use both \(self.language) and now Swift"
    }
}
//MARK: Extension for interchangeable algorithms
extension Developer where Self: IOSEngineer {
    func traits() -> String { return iosTraits }
}

extension Developer where Self == WebProgrammer {
    func traits() -> String {
        return "We are cool and we do both \(self.language) and CSS also."
    }
}
///This one is cool :) because it has access to Developer
extension Developer where Self == RubyArchitect {
    func traits() -> String {
        return "Ruby is powerful and we code in \(self.language) and \(self.iosTraits)"
    }
}
//MARK: Team Concrete Type
class Team {
    let developers: [Developer]

    init(developers: [Developer]) {
        self.developers = developers
    }
}

extension Team: Developer {
    var language: String {
        return self.developers.reduce("") { _language, developer -> String in
            return _language+" "+developer.language
        }
    }

    func traits() -> String {
        return self.developers.reduce("") { _trait, developer -> String in
            return _trait+"\n"+developer.traits()
        }
    }
}

//MARK: Usage
let dev1 = IOSEngineer()
let dev2 = WebProgrammer()
let dev3 = RubyArchitect()

dev1.language //Objective-C
dev2.language //HTML
dev3.language //Ruby

///Specific Character
dev1.traits //The iOS developer use both Objective-C and now Swift
dev2.traits //We are cool and we do both HTML and CSS also
dev3.traits //Ruby is powerful and we code in Ruby and The iOS developer use both Ruby and now


let team = Team(developers: [dev1, dev2, dev3])
team.language //Objective-C HTML Ruby
team.traits()

