//
//  ViewController.swift
//  Davaleba25
//
//  Created by Kote Ghudushauri on 5/20/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var searchbar: UISearchBar!
    let getCountries = APIService()
    var countries = [Country]()
    var filteredData = [Country]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        searchbar.delegate = self
        
        
        getCountries.fetchCountries { (countries) in
            self.countries.append(contentsOf: countries)
            self.filteredData.append(contentsOf: countries)
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }

        }
        
    }


}
extension ViewController: UITableViewDelegate{
    
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id") as! TableViewCell
        let country = filteredData[indexPath.row]
        let filteredCountries = country
        
        let currency = filteredCountries.currencies
        var borders = ""
        for border in filteredCountries.borders {
            borders += "\(border),"
        }
        cell.countrylabel.text = filteredCountries.name
        cell.capitallabel.text = filteredCountries.capital
        cell.currencylabel.text = currency[0].symbol
        cell.borderslabel.text = borders
        return cell
        
    }
    
    
}
extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    if searchText.isEmpty == false {
        filteredData = countries.filter({ $0.name.contains(searchText) || $0.capital.contains(searchText) })
            tableview.reloadData()
            
    } else {
        filteredData = countries
        tableview.reloadData()
    }
        
    }
}
