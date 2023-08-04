//
//  ViewController.swift
//  NewsCaster
//
//  Created by Paul Matar on 08/06/2023.
//

import UIKit
import Logs

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        let d = JSONDecoder()
        d.keyDecodingStrategy = .convertFromSnakeCase
        let api = API(decoder: d)
        
        Task {
            let request = Endpoint.search(12)
            do {
                let data: MemesData? = try await api.perform(request: request)
                Logs<Self>.log(data?.memes.first?.title)
            } catch {
                Logs<Self>.log(error)
            }
        }
        
        
    }


}

