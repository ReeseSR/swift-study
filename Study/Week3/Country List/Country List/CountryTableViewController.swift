//
//  CountryTableViewController.swift
//  Country List
//
//  Created by 배소린 on 2021/10/03.
//

import UIKit

class CountryTableViewController: UITableViewController {

    let flags = getCountries();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return flags.count;
    }


    // What is each particular item
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)

        cell.textLabel?.text = flags[indexPath.row].flag + " - " + flags[indexPath.row].name;
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = flags[indexPath.row];
        performSegue(withIdentifier: "DefinitionSegue", sender: selectedCountry)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let defOfViewController = segue.destination as? CountryDefinitionViewController{
            
            if let selectedCountry = sender as? Country{
            defOfViewController.country = selectedCountry;
            
        }
    }
}
}
