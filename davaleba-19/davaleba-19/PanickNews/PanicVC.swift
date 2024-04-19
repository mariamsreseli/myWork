//
//  PanicVC.swift
//  davaleba-19
//
//  Created by Mariam Sreseli on 4/19/24.
//

import UIKit

struct Welcome: Decodable {
    let list: [List]
    
    enum CodingKeys: String, CodingKey {
        case list = "List"
    }
}

struct List: Decodable {
    let title, time: String
    let url: String
    let type: Int
    let photoURL: String
    let photoAlt: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case time = "Time"
        case url = "Url"
        case type = "Type"
        case photoURL = "PhotoUrl"
        case photoAlt = "PhotoAlt"
    }
}

class PanicVC: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var news: Welcome?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConstraints()
        getNews()
    }
    
    private func getNews() {
        guard let url = URL(string: "https://imedinews.ge/api/categorysidebarnews/get") else {
            fatalError("URL failed")
        }
        URLSession.shared.dataTask(with: url, completionHandler: { [weak self] (data: Data?, response: URLResponse?, error: Error?) in
            guard let self = self else { return }
            if let data = data {
                do {
                    let news = try JSONDecoder().decode(Welcome.self, from: data)
                    DispatchQueue.main.async {
                        self.news = news
                        self.tableView.reloadData()
                    }
                } catch {
                    fatalError("Error decoding data: \(error)")
                }
            } else if let error = error {
                fatalError("Error fetching data: \(error)")
            }
        }).resume()
        
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
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "imediCell")
    }
}

extension PanicVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news?.list.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imediCell", for: indexPath) as! NewsTableViewCell
        if let newsItem = news?.list[indexPath.row] {
            cell.textLabel?.text = newsItem.title
            cell.textLabel?.numberOfLines = 0
            
            if let imageURL = URL(string: newsItem.photoURL) {
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: imageURL) {
                        DispatchQueue.main.async {
                            cell.backgroundImageView.image = UIImage(data: data)
                        }
                    }
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
            headerView.backgroundColor = .white
            
            let label = UILabel(frame: headerView.bounds)
            label.text = "Panicka News"
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
        if let selectedNews = news?.list[indexPath.row] {
            let newsDetVC = NewsDetailVC()
            newsDetVC.newsTitle = selectedNews.title
            newsDetVC.photoURL = selectedNews.photoURL
            navigationController?.pushViewController(newsDetVC, animated: true)
        }
    }
}


