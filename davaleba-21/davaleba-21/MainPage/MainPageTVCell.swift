//
//  MainPageTVCell.swift
//  davaleba-21
//
//  Created by Mariam Sreseli on 4/25/24.
//

import UIKit

class NewTableViewCell: UITableViewCell {
    
    let flagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var flagImageURL: String?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(flagImageView)
        
        NSLayoutConstraint.activate([
            flagImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            flagImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            flagImageView.widthAnchor.constraint(equalToConstant: 40),
            flagImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        flagImageView.layer.cornerRadius = 10
        flagImageView.clipsToBounds = true
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 15
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.black.cgColor
        
        textLabel?.textColor = .black
        textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        textLabel?.textAlignment = .right
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Error")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 10, bottom: 5, right: 10))
    }
    
    private func updateAppearanceForUserInterfaceStyle(_ userInterfaceStyle: UIUserInterfaceStyle) {
        let isDarkMode = userInterfaceStyle == .dark
        contentView.backgroundColor = isDarkMode ? .secondarySystemBackground : .systemBackground
        textLabel?.textColor = isDarkMode ? .white : .label
    }
    
    func setFlagImage(from url: String?) {
        guard let urlString = url, let imageURL = URL(string: urlString) else {
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: imageURL),
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.flagImageView.image = image
                }
            }
        }
    }
}

