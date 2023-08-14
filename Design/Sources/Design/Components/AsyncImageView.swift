//
//  File.swift
//  
//
//  Created by Paul Matar on 14/08/2023.
//

import UIKit
import Logs

public final class AsyncImageView: UIImageView {
    private var imageURL: URL? {
        didSet {
            dowloadImage()
        }
    }
            
    public func setImage(_ imageURL: URL?, placeholder: UIImage? = nil) {
        self.image = placeholder
        self.imageURL = imageURL
    }
    
    private func dowloadImage() {
        guard let imageURL else { return }
        
        Task { @MainActor in
            do {
                let loadedImage = try await ImageLoader.shared.download(from: imageURL)
                if imageURL == self.imageURL {
                    image = loadedImage
                }
            } catch {
                Logs<Self>.log(error)
            }
        }
    }
}
