//
//  ViewController.swift
//  NewsCaster
//
//  Created by Paul Matar on 08/06/2023.
//

import UIKit
import Logs
import Domain

final class ViewController: UIViewController {
    
    private let repo = NewsRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        Task {
            do {
                let articles = try await repo.getTopHeadlines(50)
                articles.forEach {
                    print($0.author, $0.title, $0.publishedAt)
                }
            } catch {
                Logs<Self>.log(error)
            }
        }
    }
}

