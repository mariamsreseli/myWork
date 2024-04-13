//
//  ViewController.swift
//  davaleba-16
//
//  Created by Mariam Sreseli on 4/13/24.
//

import UIKit

class ViewController: UIViewController {
    
    var sectionTitle: [String] = []
    //var alphabetTableView: UITableView!
    
    
    let peopleTableView: UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = .white
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
        
    }()
    
         let people = ["Nodar Ghachava", "Elene Donadze", "Temuri Chitashvili", "Irina Datoshvili", "Tornike Elqanashvili", "Ana Ioramashvili", "Nini Bardavelidze", "Barbare Tepnadze", "Valeri Mekhashishvili", "Zuka Papuashvili", "Nutsa Beriashvili", "Luka Kharatishvili", "Data Robakidze", "Nika Kakhniashvili", "Sandro Gelashvili", "Ana Namgaladze", "Bakar Kharabadze", "Archil Menabde", "Tamuna Kakhidze", "Giorgi Michitashvili", "Salome Topuria", "Luka Gujejiani", "Gega Tatulishvili", "Raisa Badalova", "Aleksandre Saroiani", "Begi Kopaliani", "Akaki Titberidze", "Sandro Kupatadze", "Gvantsa Gvagvalia", "Vano Kvakhadze"]
    
    
    //let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { String($0) }
    


        override func viewDidLoad() {
            super.viewDidLoad()
            
            for person in people {
                let firstLetter = String(person.prefix(1))
                if !sectionTitle.contains(firstLetter) {
                    sectionTitle.append(firstLetter)
                }
            }
            
            sectionTitle.sort()
        
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
            
            let imageView = UIImageView(frame: CGRect(x: 10, y: 60, width: 50, height: 50))
            imageView.image = UIImage(named: "mariam")
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = imageView.frame.width / 2
            imageView.clipsToBounds = true
            headerView.addSubview(imageView)
            
            
            let titleLabel = UILabel(frame: CGRect(x: 10, y: 15, width: view.frame.width - 20, height: 30))
            titleLabel.text = "iOS Squad"
            titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
            headerView.addSubview(titleLabel)
            
            let nameLabel = UILabel(frame: CGRect(x: 70, y: 73, width: view.frame.width - 20, height: 30))
            nameLabel.text = "მარიამ სრესელი"
            nameLabel.font = UIFont.systemFont(ofSize: 18)
            headerView.addSubview(nameLabel)
            
            peopleTableView.tableHeaderView = headerView
            
//            alphabetTableView = UITableView(frame: CGRect(x: view.frame.width - 30, y: 100, width: 30, height: view.frame.height - 150))
//            alphabetTableView.dataSource = self
//            alphabetTableView.delegate = self
//            alphabetTableView.register(UITableView.self, forCellReuseIdentifier: "alphabetCell")
//            view.addSubview(alphabetTableView)
            
            
            tableViewConstrains()
            
        }
        }

    
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionTitle.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionLetter = sectionTitle[section]
        return people.filter { String($0.prefix(1)) == sectionLetter }.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let sectionLetter = sectionTitle[indexPath.section]
        let peopleInSection = people.filter {String($0.prefix(1)) == sectionLetter }
        cell.textLabel?.text = peopleInSection[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
        
        
        
        func tableViewConstrains() {
            view.addSubview(peopleTableView)
            peopleTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
            peopleTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
            peopleTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
            peopleTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
            
            peopleTableView.dataSource = self
            peopleTableView.delegate = self
            
            
        }
        
    }
    
    

