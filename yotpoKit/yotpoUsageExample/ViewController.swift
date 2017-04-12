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
        let myReview = API().myReview
        myReview.getReviews(product_id: "20005996") { (code, msg, reviews) in
            if let rec = reviews {
                print(rec)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

