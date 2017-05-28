//
//  ViewController.swift
//  ButtonExample
//
//  Created by Michinobu Nishimoto on 2017-05-27.
//  Copyright © 2017 Michinobu Nishimoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextView(_ sender: UIButton) {
        let storyBoard: UIStoryboard = self.storyboard!
        let nextView = storyBoard.instantiateViewController(withIdentifier: "next")
        present(nextView, animated: true, completion: nil)        
    }


}

