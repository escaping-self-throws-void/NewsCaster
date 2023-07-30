//
//  JSONCoder.swift
//  NewsCaster
//
//  Created by Paul Matar on 29/07/2023.
//

import OSLog

public struct JSONCoder: Coder {
    let encoder: JSONEncoder
    let decoder: JSONDecoder
    let serializationWritingOptions: JSONSerialization.WritingOptions
    let serializationReadingOptions: JSONSerialization.ReadingOptions
    
    public init(
        encoder: JSONEncoder = .init(),
        decoder: JSONDecoder = .init(),
        serializationWritingOptions: JSONSerialization.WritingOptions = [],
        serializationReadingOptions: JSONSerialization.ReadingOptions = []
    ) {
        self.encoder = encoder
        self.decoder = decoder
        self.serializationWritingOptions = serializationWritingOptions
        self.serializationReadingOptions = serializationReadingOptions
    }
    
    public func encode<T>(_ value: T) -> Data? {
        do {
            if let encodable = T.self as? Encodable {
                return try encoder.encode(encodable)
            }
            return try JSONSerialization.data(withJSONObject: T.self, options: serializationWritingOptions)
        } catch {
            handleError(error)
            return nil
        }
    }
    
    public func decode<T>(_ data: Data) -> T? {
        do {
            return try JSONSerialization.jsonObject(with: data, options: serializationReadingOptions) as? T
        } catch {
            handleError(error)
            return nil
        }
    }
    
    public func decode<D: Decodable>(from data: Data) -> D? {
        do {
            return try decoder.decode(D.self, from: data)
        } catch {
            handleError(error)
            return nil
        }
    }
}

extension JSONCoder {
    private func handleError(_ error: Error) {
        guard let decodingError = error as? DecodingError else {
            Logger.errors.error("Unknown decoding error")
            return
        }
        switch decodingError {
        case .typeMismatch(let type, let context):
            Logger.errors.error("Type '\(type)' mismatch:  \(context.debugDescription) \n\n codingPath: \(context.codingPath)")
        case .valueNotFound(let value, let context):
            Logger.errors.error("Value not found: \(context.debugDescription) \n\n value: \(value)")
        case .keyNotFound(let codingKey, let context):
            Logger.errors.error("Key not found: \(context.debugDescription) \n\n codingKey: \(codingKey.description)")
        case .dataCorrupted(let context):
            Logger.errors.error("Data corrupted: \(context.debugDescription)")
        @unknown default:
            Logger.errors.error("Unknown decoding error")
        }
    }
}
