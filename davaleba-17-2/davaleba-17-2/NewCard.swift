//
//  NewCard.swift
//  davaleba-17-2
//
//  Created by Mariam Sreseli on 4/15/24.
//

import UIKit

class NewCard: UIViewController {
    
    let someImageView: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "back1")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        return theImageView
    }()
    
    let button: UIButton = {
        let button1 = UIButton()
        button1.translatesAutoresizingMaskIntoConstraints = false
        return button1
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .clear
        return stack
    }()
    
    let redImage: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "red")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        return theImageView}()
    
    let purpleImage: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "purple")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        return theImageView}()
    
    let greenImage: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "green")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        return theImageView}()
    
    let yellowImage: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "yellow")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        return theImageView}()
    
    let label: UILabel = {
        let label1 = UILabel()
        label1.textAlignment = .center
        label1.text = "აირჩიეთ აიქონი"
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.textColor = .white
        label1.font = UIFont(name: "FiraGO-Medium", size: 16)
        return label1
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(someImageView)
        someImageViewConstraints()
        
        view.addSubview(button)
        buttonConstraints()
        
        view.addSubview(stackView)
        configurateStackView()
        stackViewItems()
        
        view.addSubview(redImage)
        view.addSubview(purpleImage)
        view.addSubview(greenImage)
        view.addSubview(yellowImage)
        
        redImageConstrains()
        purpleImageConstraints()
        greenImageConstraints()
        yellowImageConstraints()
        
        view.addSubview(label)
        labelConstrains()
    }
    
    func someImageViewConstraints() {
        someImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        someImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        someImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        someImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    
    func buttonConstraints() {
        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 661).isActive = true
        button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 121).isActive = true
        button.widthAnchor.constraint(equalToConstant: 132).isActive = true
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        button.setTitle("დამატება", for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont(name: "FiraGO-Medium", size: 15)
    }
    
    func configurateStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 2.0
        
        setstackViewConstrains()
    }
    
    func setstackViewConstrains() {
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 310).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func stackViewItems() {
        let label1 = UILabel()
        let textField1 = UITextField()
        let label2 = UILabel()
        let textField2 = UITextField()
        
        label1.text = "სათაური"
        textField1.attributedPlaceholder = NSAttributedString(
            string: "პანიკა, დახმარება მჭირდება",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        label2.text = "აღწერა"
        textField2.attributedPlaceholder = NSAttributedString(
            string: "ფიგმამ გამიჭედა და ჰელფ",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(textField1)
        stackView.addArrangedSubview(label2)
        stackView.addArrangedSubview(textField2)
        
        label1.textColor = .white
        label1.font = UIFont(name: "FiraGO-Medium", size: 16)
        
        label2.textColor = .white
        label2.font = UIFont(name: "FiraGO-Medium", size: 16)
        
        textField1.layer.cornerRadius = 10
        textField1.layer.borderWidth = 1
        textField1.layer.borderColor = UIColor.lightGray.cgColor
        textField1.textColor = .white
        textField1.heightAnchor.constraint(equalToConstant: 45).isActive = true
        textField1.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 20).isActive = true
        
        textField2.layer.cornerRadius = 10
        textField2.layer.borderWidth = 1
        textField2.layer.borderColor = UIColor.lightGray.cgColor
        textField2.heightAnchor.constraint(equalToConstant: 45).isActive = true
        textField2.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 20).isActive = true
    }
    
    func redImageConstrains() {
        redImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 313).isActive = true
        redImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 62).isActive = true
        redImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        redImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func purpleImageConstraints() {
        purpleImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 313).isActive = true
        purpleImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 129).isActive = true
        purpleImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        purpleImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func greenImageConstraints() {
        greenImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 313).isActive = true
        greenImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 196).isActive = true
        greenImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        greenImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func yellowImageConstraints() {
        yellowImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 313).isActive = true
        yellowImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 263).isActive = true
        yellowImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        yellowImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func labelConstrains() {
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 275).isActive = true
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 43).isActive = true
        label.widthAnchor.constraint(equalToConstant: 170).isActive = true
        label.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
    }
}


