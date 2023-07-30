//
//  ViewController.swift
//  NewsCaster
//
//  Created by Paul Matar on 08/06/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
       
        let api = API()
        
        Task {
            let request = Endpoint.search(12)
            let data: MemesData? = try? await api.perform(request: request)
            print(data?.memes.first?.title)
            
        }
        
        
    }


}

