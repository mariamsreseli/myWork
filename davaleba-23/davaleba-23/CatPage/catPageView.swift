//
//  catPageVC.swift
//  davaleba-23
//
//  Created by Mariam Sreseli on 5/3/24.
//

import UIKit

class catPageVC: UIViewController {
    
    var catFactsViewModel = CatPageViewModel()
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        fetchCatFacts()
    }
    
    func setUpTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 50))
        headerView.backgroundColor = .lightGray
        
        let label = UILabel(frame: headerView.bounds)
        label.text = "Cat Facts"
        label.textColor = .systemPink
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.backgroundColor = .white
        label.textAlignment = .center
        headerView.addSubview(label)
        tableView.tableHeaderView = headerView
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    }
    
    func fetchCatFacts() {
        catFactsViewModel.fetchCatFacts { [weak self] catFacts, error in
            if let error = error {
                print("Error fetching cat facts: \(error)")
            } else if catFacts != nil {
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }
}

extension catPageVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catFactsViewModel.catFacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let fact = catFactsViewModel.catFacts[indexPath.row]
        cell.textLabel?.text = fact.fact
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.textColor = .purple
        return cell
    }
}
