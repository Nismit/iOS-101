//
//  SecViewController.swift
//  ButtonExample
//
//  Created by Michinobu Nishimoto on 2017-05-27.
//  Copyright © 2017 Michinobu Nishimoto. All rights reserved.
//

import UIKit

class SecViewController: UIViewController {
    
    let sampleButton: UIButton = UIButton(type: .custom)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        sampleButton.setTitle("Back To Home", for: .normal)
        sampleButton.setTitleColor(UIColor.blue, for: .normal)
        sampleButton.addTarget(self, action: #selector(backToHome), for: .touchUpInside)
        //sampleButton.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        sampleButton.sizeToFit()
        sampleButton.center = self.view.center
        self.view.addSubview(sampleButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backToHome(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
