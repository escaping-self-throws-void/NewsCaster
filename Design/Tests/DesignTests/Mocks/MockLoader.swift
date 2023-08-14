//
//  File.swift
//  
//
//  Created by Paul Matar on 14/08/2023.
//

import UIKit
import Networking
import Utilities
@testable import Design

actor MockLoader: Loader {
    static let shared = MockLoader()
    
    @Injected(.singleton)
    private var network: Networking
    private let imageCache = ImageCache.shared
    private init() {}
    
    func download(from url: URL) async throws -> (UIImage, String) {
        if let cachedImage = await imageCache.getImage(forKey: url.lastPathComponent) {
            return (cachedImage, "cached")
        }
        
        let data = try await network.fetch(from: url)
        
        guard let image = UIImage(data: data) else {
            throw ImageLoader.Error.failedToExtract
        }
        
        await imageCache.saveImage(image, forKey: url.lastPathComponent)
        
        return (image, "downloaded")
    }
}
