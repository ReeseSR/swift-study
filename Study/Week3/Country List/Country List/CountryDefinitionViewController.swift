//
//  CountryDefinitionViewController.swift
//  Country List
//
//  Created by 배소린 on 2021/10/04.
//

import UIKit

class CountryDefinitionViewController: UIViewController {

    @IBOutlet weak var bigFlagLabel: UILabel!
    
    @IBOutlet weak var countryDefinitionLabel: UILabel!
    
    var country : Country = Country();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bigFlagLabel.text = country.flag;
        countryDefinitionLabel.text = "\(country.name) flag is \(country.flag). It was founded in \(country.year). It is in \(country.region). The population is \(country.population) million."

        // Do any additional setup after loading the view.

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
