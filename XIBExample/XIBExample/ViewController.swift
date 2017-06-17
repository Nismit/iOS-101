//
//  ViewController.swift
//  XIBExample
//
//  Created by Michinobu Nishimoto on 2017-06-17.
//  Copyright © 2017 Michinobu Nishimoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var createViewButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func createView(_ sender: UIButton) {
        let xibView = XIBView(frame: CGRect(x: 0, y: 0, width: 400, height: 300))
        self.view.addSubview(xibView)
    }
}

