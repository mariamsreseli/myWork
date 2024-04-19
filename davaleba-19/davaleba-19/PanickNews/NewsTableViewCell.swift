//
//  NewsTableViewCell.swift
//  davaleba-19
//
//  Created by Mariam Sreseli on 4/19/24.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(backgroundImageView)
        backgroundImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        backgroundImageView.layer.cornerRadius = 10
        backgroundImageView.clipsToBounds = true
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        contentView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        textLabel?.textColor = .white
        textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Error")
    }
}
