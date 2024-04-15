//
//  MainViewController.swift
//  davaleba-17-2
//
//  Created by Mariam Sreseli on 4/15/24.
//

import UIKit

class MainViewController: UIViewController {
    
    let someImageView: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "back1")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        return theImageView
    }()
    
    var collectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let button: UIButton = {
        let button1 = UIButton()
        button1.translatesAutoresizingMaskIntoConstraints = false
        return button1
    }()
    
    let myData = [("red", "Beka ras gverchi?"), ("purple", "რამე სიმღერა მირჩიეთ"), ("green", "ფიგმამ თქვენც დაგტანჯათ?"), ("yellow", "მეტი ბედინა გვინდა")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(someImageView)
        someImageViewConstraints()
        
        view.addSubview(button)
        buttonConstraints()
        
        view.addSubview(collectionView)
        collectionViewConstrains()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "myCell")
    }
    
    func someImageViewConstraints() {
        someImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        someImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        someImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        someImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    
    func buttonConstraints() {
        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 660).isActive = true
        button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 43).isActive = true
        button.widthAnchor.constraint(equalToConstant: 290).isActive = true
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        button.setTitle("ახალი წუწუნ ბარათის დამატება", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont(name: "FiraGO-Medium", size: 15)
        
        button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
    }
    
    @objc func nextPage() {
        let next = NewCard()
        navigationController?.pushViewController(next, animated: true)
    }
    
    func collectionViewConstrains() {
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 77).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -50).isActive = true
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        myData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! MyCollectionViewCell
        let (imageName, text) = myData[indexPath.item]
        cell.imageView.image = UIImage(named: imageName)
        cell.label.text = text
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 150, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    class MyCollectionViewCell: UICollectionViewCell {
        
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
            label.textColor = .white
            label.font = UIFont(name: "FiraGO-Medium", size: 16)
            return label
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            contentView.addSubview(imageView)
            contentView.addSubview(label)
            
            contentView.backgroundColor = .darkText
            contentView.layer.cornerRadius = 20
            
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
            fatalError("init(coder:) ar mushaobs")
        }
    }
}


