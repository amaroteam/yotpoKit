//
//  ViewController.swift
//  yotpoUsageExample
//
//  Created by Liliane Lima on 12/04/17.
//  Copyright © 2017 Liliane Lima. All rights reserved.
//

import UIKit
import yotpoKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let myReview = API(appK: "0eU0TYNuFzWbeD60wD2lB7UWnCbAkVtX3vwtaEH0", clientS: "lYJniXPbu5AD0pY8fEUBvVYKIT54TWUIdXd7NKUz").myReview
        
        let post = Post(sku: "20006585", productTitle: "COLAR PEDRAS CRYSTAL", productUrl: "https://amaro.com/p/colar-pedras-crystal/prata", displayName: "Liliane", email: "liliane.b.lima@outlook.com",reviewTitle: "Perfeito", reviewDescription: "Amei esse colar. Muito lindo :)", reviewScore: 5)
//        myReview.saveReview(post: post) { (code, msg) in
//            print(msg)
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

