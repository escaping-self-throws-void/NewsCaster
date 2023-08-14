//
//  File.swift
//  
//
//  Created by Paul Matar on 14/08/2023.
//

import UIKit
import Networking
import Utilities

actor ImageLoader: Loader {
    static let shared = ImageLoader()
    
    @Injected(.singleton)
    private var network: Networking
    private let imageCache = ImageCache.shared
    private init() {}
    
    func download(from url: URL) async throws -> UIImage {
        if let cachedImage = await imageCache.getImage(forKey: url.lastPathComponent) {
            return cachedImage
        }
        
        let data = try await network.fetch(from: url)
        
        guard let image = UIImage(data: data) else {
            throw Error.failedToExtract
        }
        
        await imageCache.saveImage(image, forKey: url.lastPathComponent)
        
        return image
    }
}

// MARK: - Error
extension ImageLoader {
    enum Error: LocalizedError {
        case failedToExtract
        
        var errorDescription: String? {
            switch self {
            case .failedToExtract:
                return "Failed to extract image from url"
            }
        }
    }
}
