//: SOLID Principles

import Foundation
import PlaygroundSupport

//MARK: Dependency Inversion"

enum DefaultsKey: String {
    case cookie = "Cookie"
    case session = "Session"
    case status = "Status"
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
