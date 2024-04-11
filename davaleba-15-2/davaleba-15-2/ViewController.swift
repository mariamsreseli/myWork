//
//  ViewController.swift
//  davaleba-15-2
//
//  Created by Mariam Sreseli on 4/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    let zodTextField = UITextField()
    
    let someImageView: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "glitter")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        return theImageView
    }()
    
    var stackView = UIStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(someImageView)
        someImageViewConstrains()
        configureStackView()
        stackViewItems()
        
        
    }
    
    func someImageViewConstrains() {
        someImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        someImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        someImageView.widthAnchor.constraint(equalToConstant: 500).isActive = true
        someImageView.heightAnchor.constraint(equalToConstant: 1000).isActive = true
    }
    
    func configureStackView() {
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 2.0
        stackView.alignment = .fill
        
        setStackViewConstraints()
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 230).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
    }
    
    func stackViewItems() {
        let zodLabel = UILabel()
        
        
        zodLabel.text = "ზოდიაქოს სახელი"
        
        
        zodTextField.attributedPlaceholder = NSAttributedString(
            string: "მაგ; მშვილდოსანი",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightText]
        )
        
        stackView.addArrangedSubview(zodLabel)
        stackView.addArrangedSubview(zodTextField)
        
        zodLabel.textColor = .gray
        
        zodTextField.layer.cornerRadius = 5
        zodTextField.layer.borderWidth = 1
        zodTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        zodTextField.topAnchor.constraint(equalTo: zodLabel.topAnchor, constant: 30).isActive = true
        zodTextField.textColor = .gray
        
        //        @objc func goToDescription() {
        //            let descriptionPg = descriptionViewController()
        //            navigationController?.pushViewController(descriptionPg, animated: true)
        //
        //        }
        
        let label1 = UILabel(frame: CGRect(x: 0, y: 0, width: 229, height: 34))
        label1.center = CGPoint(x: 123, y: 105)
        label1.textAlignment = .center
        label1.text = "მიშა ცაგარელის ჰაბი"
        label1.textColor = .white
        label1.font = UIFont.boldSystemFont(ofSize: 21)
        self.view.addSubview(label1)
        
        
        
        let label2 = UILabel()
        self.view.addSubview(label2)
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 75).isActive = true
        label2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        label2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        label2.numberOfLines = 0
        label2.text = "მოცემულ აპლიკაციაში შეგიძლიათ გაიგოთ თქვენი ზოდიაქოს ყველაზე გამოკვეთილი უნარები და თვისებები."
        label2.textColor = .gray
        
        
        
        let button = UIButton(frame: CGRect(x: 20, y: 420, width: 350, height: 50))
        button.backgroundColor = UIColor.purple
        button.setTitle("შემდეგ", for: .normal)
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(goToDescription), for: .touchUpInside)
    }
    
    @objc func goToDescription() {
        let signName = zodTextField.text
        let descriptionPg = descriptionViewController()
        navigationController?.pushViewController(descriptionPg, animated: true)
        
     
        
    }
    
    
    
}



#Preview {
    ViewController()
}
