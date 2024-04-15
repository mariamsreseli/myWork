//
//  myCollectionViewCell.swift
//  davaleba-17-2
//
//  Created by Mariam Sreseli on 4/15/24.
//

import UIKit

class myCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        let label: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.numberOfLines = 0
            return label
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            contentView.addSubview(imageView)
            contentView.addSubview(label)
            
            contentView.backgroundColor = .systemGray4
            
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
                imageView.widthAnchor.constraint(equalToConstant: 50),
                
                label.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
                label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
                label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
            ])
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) 404")
        }
}
