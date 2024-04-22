//
//  FirstVC.swift
//  davaleba20
//
//  Created by Mariam Sreseli on 4/21/24.
//

import UIKit

class FirstVC: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var countries: [country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCountries()
        tableViewConstraints()
    }
    
    private func getCountries() {
        guard let url = URL(string: "https://restcountries.com/v3.1/all") else {
            fatalError("URL failed")
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }
            
            if error != nil { return }
            
            guard let data = data else { return }
            
            do {
                countries.self = try JSONDecoder().decode([country].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
    
    func tableViewConstraints() {
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(NewTableViewCell.self, forCellReuseIdentifier: "countryCell")
    }
}

extension FirstVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! NewTableViewCell
        let country = countries[indexPath.row]
        if let commonName = country.name?.common {
            cell.textLabel?.text = commonName
        } else {
            cell.textLabel?.text = "Name Not Available"
        }
        cell.setFlagImage(from: country.flags?.png)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
            headerView.backgroundColor = .white
            
            let label = UILabel(frame: headerView.bounds)
            label.text = "Countries"
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 24)
            label.textColor = .black
            label.textAlignment = .left
            headerView.addSubview(label)
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15).isActive = true
            return headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 50
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = countries[indexPath.row]
        let detVC = DetailsVC()
        detVC.flagURL = country.flags?.png
        detVC.flagInfoText = country.flags?.alt
        navigationController?.pushViewController(detVC, animated: true)
    }
}

