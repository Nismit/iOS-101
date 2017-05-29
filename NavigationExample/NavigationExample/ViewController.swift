//
//  ViewController.swift
//  NavigationExample
//
//  Created by Michinobu Nishimoto on 2017-05-29.
//  Copyright © 2017 Michinobu Nishimoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let button: UIButton = UIButton(frame: CGRect(x: view.bounds.width / 2 - 50, y: view.bounds.height / 2, width: 100, height: 50))
        button.backgroundColor = UIColor.black
        button.addTarget(self, action: #selector(pushToNextVC), for: .touchUpInside)
        view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pushToNextVC(_ sender: UIButton) {
        let newVC = UIViewController()
        newVC.view.backgroundColor = UIColor.red
        self.navigationController?.pushViewController(newVC, animated: true)
    }


}

