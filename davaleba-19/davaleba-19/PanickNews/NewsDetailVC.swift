//
//  NewsDetailVC.swift
//  davaleba-19
//
//  Created by Mariam Sreseli on 4/20/24.
//

import UIKit

class NewsDetailVC: UIViewController {
    
    var newsTitle: String?
    var photoURL: String?
    
    let newsPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupUI()
        
        if let photoURLString = photoURL, let photoURL = URL(string: photoURLString) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: photoURL) {
                    DispatchQueue.main.async { [weak self] in
                        self?.newsPhotoImageView.image = UIImage(data: data)
                    }
                }
            }
        }
        
        newsTitleLabel.text = newsTitle
    }
    
    private func setupUI() {
        let headerLabel: UILabel = {
            let label = UILabel()
            label.text = "Details"
            label.textAlignment = .left
            label.font = UIFont.boldSystemFont(ofSize: 24)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        view.addSubview(headerLabel)
        headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        headerLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(newsPhotoImageView)
        newsPhotoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        newsPhotoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        newsPhotoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        newsPhotoImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        view.addSubview(newsTitleLabel)
        newsTitleLabel.topAnchor.constraint(equalTo: newsPhotoImageView.bottomAnchor, constant: 20).isActive = true
        newsTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        newsTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
    }
}




