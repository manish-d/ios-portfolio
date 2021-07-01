//
//  APIConfigurations.swift
//  Configurator
//
//  Created by Manish on 01/07/21.
//

import Foundation

enum APIConfiguration {
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }

    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey:key) else {
            throw Error.missingKey
        }

        switch object {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
}

enum API {
    static var baseURL: URL? {
        do {
            return try URL(string: "https://" + APIConfiguration.value(for: "API_BASE_URL"))!
        } catch (let error) {
            print(error.localizedDescription)
        }
        
        return nil
    }
}
