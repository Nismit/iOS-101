//
//  ViewController.swift
//  GestureExample
//
//  Created by Michinobu Nishimoto on 2017-05-30.
//  Copyright © 2017 Michinobu Nishimoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let swipeRight = UISwipeGestureRecognizer()
    let swipeLeft = UISwipeGestureRecognizer()
    let swipeUp = UISwipeGestureRecognizer()
    let swipeDown = UISwipeGestureRecognizer()
    
    let rotate = UIRotationGestureRecognizer()
    let tap = UITapGestureRecognizer()
    
    //let pinch = UIPinchGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        // Shortcode
        swipeDown.direction = .down
        
        //Add methods
        swipeRight.addTarget(self, action: #selector(swipedRight))
        swipeLeft.addTarget(self, action: #selector(swipedLeft))
        swipeUp.addTarget(self, action: #selector(swipedUp))
        swipeDown.addTarget(self, action: #selector(swipedDown))
        
        tap.numberOfTouchesRequired = 2
        tap.numberOfTapsRequired = 2
        //In your emulator, press option key, and then double click
        //it will be worked
        tap.addTarget(self, action: #selector(tapped))
        
        //press option key, and then rotate
        rotate.addTarget(self, action: #selector(rotated(sender:)))
        
        
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
        self.view.addGestureRecognizer(swipeUp)
        self.view.addGestureRecognizer(swipeDown)
        self.view.addGestureRecognizer(tap)
        self.view.addGestureRecognizer(rotate)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func swipedRight() {
        print("Swiped Right")
    }
    
    func swipedLeft() {
        print("Swiped Left")
    }
    
    func swipedUp() {
        print("Swiped Up")
    }
    
    func swipedDown() {
        print("Swiped Down")
    }
    
    func tapped() {
        print("double tapped")
    }
    
    func rotated(sender: UIRotationGestureRecognizer) {

        if (sender.state == .began) {
            print("began rotaing")
        } else if(sender.state == .changed) {
            print("changed")
            print("Rotation \(sender.rotation)")
            print("Velocity \(sender.velocity)")
        } else if(sender.state == .ended) {
            print("ended rotaing")
        }
        
    }


}

