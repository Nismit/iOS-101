//
//  ViewController.swift
//  AccelerometerExample
//
//  Created by Michinobu Nishimoto on 2017-06-10.
//  Copyright © 2017 Michinobu Nishimoto. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    let motionManager:CMMotionManager = CMMotionManager()

    @IBOutlet weak var accelerometerX: UILabel!
    @IBOutlet weak var accelerometerY: UILabel!
    @IBOutlet weak var accelerometerZ: UILabel!
    @IBOutlet weak var rawDataButton: UIButton!
    @IBOutlet weak var lowpassDataButton: UIButton!
    @IBOutlet weak var highpassDataButton: UIButton!
    
    var acceleX: Double = 0
    var acceleY: Double = 0
    var acceleZ: Double = 0
    let Alpha = 0.4
    var flg: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if motionManager.isAccelerometerAvailable {
            // Set Interval
            motionManager.accelerometerUpdateInterval = 0.2
            
            motionManager.startAccelerometerUpdates(
                to: OperationQueue.current!,
                withHandler: {(accelData: CMAccelerometerData?, errorOC: Error?) in self.outputAccelData(acceleration: accelData!.acceleration)
            })
        } else {
            print("Accelerometer Motion is not available")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func outputAccelData(acceleration: CMAcceleration){
        accelerometerX.text = String(format: "%06f", acceleration.x)
        accelerometerY.text = String(format: "%06f", acceleration.y)
        accelerometerZ.text = String(format: "%06f", acceleration.z)
    }
    
    func lowpassFilter(acceleration: CMAcceleration){
        acceleX = Alpha * acceleration.x + acceleX * (1.0 - Alpha);
        acceleY = Alpha * acceleration.y + acceleY * (1.0 - Alpha);
        acceleZ = Alpha * acceleration.z + acceleZ * (1.0 - Alpha);
        
        accelerometerX.text = String(format: "%06f", acceleX)
        accelerometerY.text = String(format: "%06f", acceleY)
        accelerometerZ.text = String(format: "%06f", acceleZ)
    }
    
    func highpassFilter(acceleration: CMAcceleration){
        acceleX = Alpha * acceleration.x + acceleX * (1.0 - Alpha);
        acceleY = Alpha * acceleration.y + acceleY * (1.0 - Alpha);
        acceleZ = Alpha * acceleration.z + acceleZ * (1.0 - Alpha);
        
        let xh = acceleration.x - acceleX
        let yh = acceleration.y - acceleY
        let zh = acceleration.z - acceleZ
        
        accelerometerX.text = String(format: "%06f", xh)
        accelerometerY.text = String(format: "%06f", yh)
        accelerometerZ.text = String(format: "%06f", zh)
    }
    
    func stopAccelerometer(){
        if motionManager.isAccelerometerActive {
            motionManager.stopAccelerometerUpdates()
        }
    }


}

