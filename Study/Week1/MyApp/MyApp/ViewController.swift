//
//  ViewController.swift
//  MyApp
//
//  Created by 배소린 on 2021/09/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    var countDown = 100;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onButtonClick(_ sender: Any) {
        countDown -= 5;
        myLabel.text = String(countDown);
        
        if countDown <= 10 {
            myLabel.textColor = .blue;
        } else if countDown <= 50 {
            myLabel.textColor = .red;
        }
        
    }
}

