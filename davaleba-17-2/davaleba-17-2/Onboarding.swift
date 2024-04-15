//
//  Onboarding.swift
//  davaleba-17-2
//
//  Created by Mariam Sreseli on 4/15/24.
//

import UIKit

class Onboarding: UIViewController {
    
    let someImageView: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "back2")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        return theImageView
    }()
    
    let label: UILabel = {
        let labelHub = UILabel()
        labelHub.translatesAutoresizingMaskIntoConstraints = false
        return labelHub
    }()
    
    let button: UIButton = {
        let button1 = UIButton()
        button1.translatesAutoresizingMaskIntoConstraints = false
        return button1
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(someImageView)
        someImageViewConstraints()
        
        view.addSubview(label)
        labelConstraints()
        
        view.addSubview(button)
        buttonConstraints()
    }
    
    func someImageViewConstraints() {
        someImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        someImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        someImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        someImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        someImageView.contentMode = .scaleAspectFill
    }
    
    func labelConstraints() {
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 382).isActive = true
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 21).isActive = true
        label.widthAnchor.constraint(equalToConstant: 263).isActive = true
        label.heightAnchor.constraint(equalToConstant: 192).isActive = true
        
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "შედი\nაპლიკაციაში \nდა იწუწუნე \nრამდენიც გინდა"
        label.textColor = .white
        label.font = UIFont(name: "FiraGO-Medium", size: 28)
    }
    
    func buttonConstraints() {
        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 664).isActive = true
        button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 222).isActive = true
        button.widthAnchor.constraint(equalToConstant: 123).isActive = true
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        button.setTitle("დაწყება", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont(name: "FiraGO-Medium", size: 15)
        
        button.addTarget(self, action: #selector(goNext), for: .touchUpInside)
    }
    
    @objc func goNext() {
        let secondVC = MainViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
}


