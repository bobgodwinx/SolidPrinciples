//: SOLID Principles

import Foundation
import PlaygroundSupport

//MARK: Dependency Inversion"

enum DefaultsKey: String {
    case game = "Game"
}
/// A type providing DAO services for `UserDefaults` persistence.
protocol DefaultsServiceType {
    /// Read & decode a value for a given key from standard `UserDefaults`.
    ///
    /// - Parameter forKey: Defaults key to be read.
    /// - Returns: Decoded value if possible. `nil` if not present in standard defaults or if decoding threw an error.
    func read<T: Decodable>(forKey: DefaultsKey) -> T?
    /// Encode & write a value to a give key in standard `UserDefaults`.
    ///
    /// If encoding the given value failed, existing value -if any- will be erased.
    ///
    /// - Parameters:
    ///   - value: Value to encode and write to defaults.
    ///   - forKey: Defaults key to write to
    func write<T: Encodable>(_ value: T, forKey: DefaultsKey)
    /// Erase a value for a given key -if present- from standard `UserDefaults`.
    ///
    /// - Parameter key: Defaults key to erase.
    func erase(_ key: DefaultsKey)
}

extension UserDefaults: DefaultsServiceType {
    private var defaults: UserDefaults {
        return UserDefaults.standard
    }
    // MARK: Codable
    private var encoder: PropertyListEncoder {
        return PropertyListEncoder()
    }
    // MARK: Decodable
    private var decoder: PropertyListDecoder {
        return PropertyListDecoder()
    }

    // MARK: Conforming to DefaultsServiceType

    func read<T: Decodable>(forKey key: DefaultsKey) -> T? {
        guard let data = defaults.data(forKey: key.rawValue) else { return nil }
        let value = try? decoder.decode([String: T].self, from: data)
        return value?[key.rawValue]
    }

    func write<T: Encodable>(_ value: T, forKey key: DefaultsKey) {
        let data = try? encoder.encode([key.rawValue: value])
        defaults.set(data, forKey: key.rawValue)
    }

    func erase(_ key: DefaultsKey) {
        defaults.removeObject(forKey: key.rawValue)
    }
}

struct Game {
    struct Player: Codable {
        let name: String
        let level: Int
        let points: Int
        let description: String?
    }

    var players: [Player]

    init(players: [Player] = []) {
        self.players = players
    }
}

extension Game: Codable {
    enum PlayerKeys:String, CodingKey {
        case name
        case level
        case points
        case description
    }

    enum CodingKeys: String, CodingKey {
        case players
    }

    /// Encodes this value into the given encoder.
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        for player in players {
            var playerContainer = container.nestedContainer(keyedBy: PlayerKeys.self, forKey: CodingKeys.players)
            try playerContainer.encode(player.name, forKey: .name)
            try playerContainer.encode(player.level, forKey: .level)
            try playerContainer.encode(player.points, forKey: .points)
            try playerContainer.encode(player.description, forKey: .description)
        }
    }

    /// Creates a new instance by decoding from the given decoder
    init(from decoder: Decoder) throws {
        var players = [Player]()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        for key in container.allKeys {
            let playerContainer = try container.nestedContainer(keyedBy: PlayerKeys.self, forKey: key)
            let name = try playerContainer.decode(String.self, forKey: .name)
            print(name)
            let level = try playerContainer.decode(Int.self, forKey: .level)
            let points = try playerContainer.decode(Int.self, forKey: .points)
            let desc = try playerContainer.decodeIfPresent(String.self, forKey: .description)
            let player = Player(name: name, level: level, points: points, description: desc)
            players.append(player)
        }
        self.init(players: players)
    }
}


class PersistenceStore {
    private let store: UserDefaults //Anti-pattern

    init(store: UserDefaults /*Anit-pattern*/) {
        self.store = store
    }

    func save(currentGame game: Game) {
        ///Implement
    }

    func currentGame() -> Game? {
        ///Implement
        return nil
    }
}
