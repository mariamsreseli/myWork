//
//  LogInVC.swift
//  davaleba-21
//
//  Created by Mariam Sreseli on 4/29/24.
//

import UIKit

class LogInVC: UIViewController {
    
    var viewModel = LogInViewModel()
    
    let imageView: UIImageView = {
        let image1 = UIImageView()
        image1.image = UIImage(named: "logIn")
        image1.translatesAutoresizingMaskIntoConstraints = false
        return image1
    }()
    
    let buttonImage: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        return button
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 30
        stackView.backgroundColor = .white
        return stackView
    }()
    
    let label1 = UILabel()
    let textfield1 = UITextField()
    let label2 = UILabel()
    let textfield2 = UITextField()
    let label3 = UILabel()
    let textfield3 = UITextField()
    
    let buttonLogIn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("შესვლა", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 22.5
        return button
    }()
    
    let labelGreeting: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "გამარჯობა"
        label.font = label.font.withSize(20)
        label.layer.cornerRadius = 22.5
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addConstrains()
        setUpInfo()
    }
    
    func addConstrains() {
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 121).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 132).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 132).isActive = true
        
        view.addSubview(buttonImage)
        buttonImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        buttonImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 121).isActive = true
        buttonImage.widthAnchor.constraint(equalToConstant: 132).isActive = true
        buttonImage.heightAnchor.constraint(equalToConstant: 132).isActive = true
        
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 308).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        
        view.addSubview(buttonLogIn)
        buttonLogIn.topAnchor.constraint(equalTo: view.topAnchor, constant: 670).isActive = true
        buttonLogIn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        buttonLogIn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        buttonLogIn.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        view.addSubview(labelGreeting)
        labelGreeting.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelGreeting.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        labelGreeting.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        labelGreeting.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 100).isActive = true
        
        label1.text = "მომხმარებლის სახელი"
        textfield1.placeholder = "შეიყვანეთ მომხმარებლის სახელი"
        label2.text = "პაროლი"
        textfield2.placeholder = "შეიყვანეთ პაროლი"
        label3.text = "გაიმეორეთ პაროლი"
        textfield3.placeholder = "განმეორებით შეიყვანეთ პაროლი"
        
        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(textfield1)
        stackView.addArrangedSubview(label2)
        stackView.addArrangedSubview(textfield2)
        stackView.addArrangedSubview(label3)
        stackView.addArrangedSubview(textfield3)
        
        textfield1.layer.cornerRadius = 22.5
        textfield1.layer.borderWidth = 1
        textfield1.layer.borderColor = UIColor.lightGray.cgColor
        textfield1.heightAnchor.constraint(equalToConstant: 45).isActive = true
        textfield1.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 20).isActive = true
        
        textfield2.layer.cornerRadius = 22.5
        textfield2.layer.borderWidth = 1
        textfield2.layer.borderColor = UIColor.lightGray.cgColor
        textfield2.isSecureTextEntry = true
        textfield2.heightAnchor.constraint(equalToConstant: 45).isActive = true
        textfield2.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 20).isActive = true
        
        textfield3.layer.cornerRadius = 22.5
        textfield3.layer.borderWidth = 1
        textfield3.layer.borderColor = UIColor.lightGray.cgColor
        textfield3.isSecureTextEntry = true
        textfield3.heightAnchor.constraint(equalToConstant: 45).isActive = true
        textfield3.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 20).isActive = true
    }
    
    func setUpInfo() {
        buttonImage.addAction(UIAction(handler: { _ in
            self.openGallery()
        }), for: .touchUpInside)
        
        buttonLogIn.addAction(UIAction(handler: { _ in
            self.buttonLogInTapped()
        }), for: .touchUpInside)
    }
    
    func buttonNavTapped() {
        let landingPageVC = MainVC()
        navigationController?.pushViewController(landingPageVC, animated: true)
    }
    
    func buttonLogInTapped() {
        guard let username = textfield1.text, !username.isEmpty,
              let password = textfield2.text, !password.isEmpty,
              let repeatedPassword = textfield3.text, !repeatedPassword.isEmpty else {
            displayAlert(message: "გთხოვთ, ყველა ველი შეავსოთ", title: "ერორია")
            return
        }
        guard password == repeatedPassword else {
            displayAlert(message: "გთხოვთ, გაიმეოროთ სწორი პაროლი", title: "ერორია")
            return
        }
        do {
            try self.viewModel.saveCredentials(username: username, password: password)
            if self.viewModel.isFirstLogin() {
                displayAlert(message: "გილოცავთ, თქვენ წარმატებით დარეგისტრირდით აპლიკაციაში <3", title: "მოგესალმებით")
            }
            let mainPage = MainVC()
            navigationController?.pushViewController(mainPage, animated: true)
        } catch {
            displayAlert(message: "უკვე დარეგისტრირებული ხართ, გთხოვთ გაიაროთ ავტორიზაცია", title: "ერორია")
        }
    }
    
    func displayAlert(message: String, title: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ერორია", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}

extension LogInVC:  UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func openGallery(){
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true)
    }
}
