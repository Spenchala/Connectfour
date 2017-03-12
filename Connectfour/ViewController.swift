//
//  ViewController.swift
//  Connectfour
//
//  Created by Sandeep Penchala on 3/12/17.
//  Copyright © 2017 Sandeep Penchala. All rights reserved.
//

import UIKit
let rows = 4
let columns = 4

class ViewController: UIViewController {
    var game:ConnectfourGame?
    override func viewDidLoad() {
        super.viewDidLoad()
        game = ConnectfourGame(columns: columns, rows: rows)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

