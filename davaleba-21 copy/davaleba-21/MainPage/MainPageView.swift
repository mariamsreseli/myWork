//
//  MainPageView.swift
//  davaleba-21
//
//  Created by Mariam Sreseli on 4/25/24.
//

import UIKit

class MainVC: UIViewController {
    
    private let tableView = UITableView()
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchedCountries: [country] = []
    private var countryListViewModel: CountryListViewModel!
    private var isSearchActive = false
    private var searchText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupViewModel()
        setupSearchController()
        overrideUserInterfaceStyle = .light
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchController.isActive = isSearchActive
        searchController.searchBar.text = searchText
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        tableView.register(NewTableViewCell.self, forCellReuseIdentifier: "countryCell")
        tableView.overrideUserInterfaceStyle = .light
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupViewModel() {
        countryListViewModel = CountryListViewModel(countries: [])
        getCountries()
    }
    
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search here"
        searchController.searchBar.searchBarStyle = .prominent
        searchController.searchBar.backgroundColor = .white
        navigationItem.searchController = searchController
        let searchView = UIView(frame: CGRect(x: 0, y: 100, width: tableView.frame.width, height: 50))
        searchView.addSubview(searchController.searchBar)
        definesPresentationContext = true
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
                let countries = try JSONDecoder().decode([country].self, from: data)
                self.updateCountries(with: countries)
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
    
    private func updateCountries(with countries: [country]) {
        countryListViewModel = CountryListViewModel(countries: countries)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension MainVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return searchedCountries.count
        } else {
            return countryListViewModel.numberOfCountries
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! NewTableViewCell
        let country: country
        if isFiltering() {
            country = searchedCountries[indexPath.row]
        } else {
            country = countryListViewModel.countryAtIndex(indexPath.row)
        }
        if let commonName = country.name?.common {
            cell.textLabel?.text = commonName
        } else {
            cell.textLabel?.text = "Name Not Available"
        }
        cell.setFlagImage(from: country.flags?.png)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country: country
        if isFiltering() {
            country = searchedCountries[indexPath.row]
        } else {
            country = countryListViewModel.countryAtIndex(indexPath.row)
        }
        let detVC = DetailsVC(country: country)
        navigationController?.pushViewController(detVC, animated: true)
        
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
}

extension MainVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text ?? "")
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !(searchController.searchBar.text ?? "").isEmpty
    }
    
    func filterContentForSearchText(_ searchText: String) {
        searchedCountries = countryListViewModel.countries.filter { country in
            if let commonName = country.name?.common {
                return commonName.lowercased().contains(searchText.lowercased())
            }
            return false
        }
        tableView.reloadData()
    }
    
    func updateSearchControllerState() {
        isSearchActive = searchController.isActive
        searchText = searchController.searchBar.text ?? ""
    }
}
