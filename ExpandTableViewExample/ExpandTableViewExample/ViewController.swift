//
//  ViewController.swift
//  ExpandTableViewExample
//
//  Created by Michinobu Nishimoto on 2017-06-13.
//  Copyright © 2017 Michinobu Nishimoto. All rights reserved.
//

import UIKit

extension ViewController {
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var fruits: [String] = []
    var customTableView: UITableView! = {
        return UITableView()
    }()
    
    var heightConstraints: [NSLayoutConstraint] = []
    var flag:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.lightGray
        
        customTableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        //customTableView.rowHeight = 200
        customTableView.sectionHeaderHeight = 40
        
        fruits = ["Apple", "Watermelon", "Pineapple", "Banana", "Pear", "Kiwi", "Watermelon", "Pineapple", "Banana", "Pear", "Kiwi"]
        
        customTableView.delegate = self
        customTableView.dataSource = self
        
        customTableView.register(UITableViewCell.self, forCellReuseIdentifier: "test")
        self.view.addSubview(customTableView)
        
        customTableView.translatesAutoresizingMaskIntoConstraints = false
        customTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        //customTableView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 0).isActive = true
        customTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        customTableView.widthAnchor.constraint(equalToConstant: self.view.bounds.width).isActive = true
    
        self.heightConstraints.append(customTableView.heightAnchor.constraint(equalToConstant: 300))
        self.heightConstraints.append(customTableView.heightAnchor.constraint(equalToConstant: 500))
        self.heightConstraints[0].isActive = true
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch")
        if flag {
            self.heightConstraints[1].isActive = false
            self.heightConstraints[0].isActive = true
            flag = false
        } else {
            self.heightConstraints[0].isActive = false
            self.heightConstraints[1].isActive = true
            flag = true
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
        
        //self.view.layoutIfNeeded()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Show Lists"
        label.textAlignment = .center
        label.sizeToFit()
        label.center = self.view.center
        label.textColor = UIColor.black
        return label
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "test", for: indexPath)
        cell.textLabel!.text = fruits[indexPath.row]
        return cell
    }

}

