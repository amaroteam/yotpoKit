//
//  ViewController.swift
//  yotpoUsageExample
//
//  Created by Liliane Lima on 12/04/17.
//  Copyright © 2017 AMARO Fashion. All rights reserved.
//

import UIKit
import yotpoKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        _ = APIYotpo(appK: "appKey", clientS: "clientService").myQuestion
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

