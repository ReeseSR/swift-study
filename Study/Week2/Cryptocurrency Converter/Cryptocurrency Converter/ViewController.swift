//
//  ViewController.swift
//  Cryptocurrency Converter
//
//  Created by bsorinnn on 2021/09/27.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBOutlet weak var ratioTextField: UITextField!
    
    
    @IBOutlet weak var inputTextField: UITextField!
    
    
    @IBOutlet weak var toggleCurrency: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultLabel.text = ""
    }

    @IBAction func exchangeButton(_ sender: Any) {
        let ratio = Double(ratioTextField.text!)!
        
        let input = Double(inputTextField.text!)!
        
        let result = ratio * input
        
        if toggleCurrency.selectedSegmentIndex == 0 {
            resultLabel.text = "BTC \(result)"
        } else{
            resultLabel.text = "ETC \(result)"
        }
        
        
        
        
    }
    
}

