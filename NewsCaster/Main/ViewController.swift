//
//  ViewController.swift
//  NewsCaster
//
//  Created by Paul Matar on 08/06/2023.
//

import UIKit
import Logs
import API

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        let d = JSONDecoder()
        d.keyDecodingStrategy = .convertFromSnakeCase
        let api = API(decoder: d)
        
        Task {
            let request = HeadlinesRequest.topHeadlinesUS
            do {
                let data: Data = try await api.perform(request: request)
                Logs<Self>.log(data.debugDescription)
            } catch {
                Logs<Self>.log(error)
            }
        }
        
        
    }


}

