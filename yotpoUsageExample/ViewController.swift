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
        _ = APIYotpo(appK: "appKey", clientS: "clientSecret").yotpo
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

