//
//  HomeViewController.swift
//  NewsCaster
//
//  Created by Paul Matar on 08/06/2023.
//

import UIKit
import Domain
import Utilities

public final class HomeViewController: UIViewController {
    
    private let repo = ArticlesRepository()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        Task {
//            let articles = await repo.get(50)
//            articles.forEach {
//                debugPrint($0.author, $0.title, $0.publishedAt)
//            }
//        }

    }
}

