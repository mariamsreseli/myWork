//
//  ViewController.swift
//  davaleba-14
//
//  Created by Mariam Sreseli on 4/7/24.
//

import UIKit

class ViewController: UIViewController {
    
    var stackView = UIStackView()
    var stackView1 = UIStackView()
    var stackView2 = UIStackView()

    
    let someImageView: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "lock")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        return theImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(someImageView)
        
        view.backgroundColor = .white
        someImageViewConstrains()
        configureStackView()
        stackViewItems()
        configureStackView1()
        stackViewItems1()

        
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 35))
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textColor = .black
        label.center = CGPoint(x: 200, y: 310)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "ავტორიზაცია"
        self.view.addSubview(label)
        
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 1.0))
        lineView.center = CGPoint(x: 200, y: 340)
        lineView.layer.borderWidth = 1.0
        lineView.layer.borderColor = UIColor.systemBlue.cgColor
        self.view.addSubview(lineView)
        
        let button = UIButton(frame: CGRect(x: 20, y: 580, width: 352, height: 50))
        button.backgroundColor = UIColor.systemBlue
        button.setTitle("შესვლა", for: .normal)
        self.view.addSubview(button)
    
        let lineView2 = UIView(frame: CGRect(x: 0, y: 0, width: 145, height: 1.0))
        lineView2.center = CGPoint(x: 95, y: 660)
        lineView2.layer.borderWidth = 1.0
        lineView2.layer.borderColor = UIColor.lightGray.cgColor
        self.view.addSubview(lineView2)
        
        let lineView3 = UIView(frame: CGRect(x: 0, y: 0, width: 143, height: 1.0))
        lineView3.center = CGPoint(x: 298, y: 660)
        lineView3.layer.borderWidth = 1.0
        lineView3.layer.borderColor = UIColor.lightGray.cgColor
        self.view.addSubview(lineView3)
        
        let labelan = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 35))
        labelan.font = UIFont.preferredFont(forTextStyle: .footnote)
        labelan.textColor = .black
        labelan.center = CGPoint(x: 200, y: 660)
        labelan.textAlignment = .center
        labelan.font = UIFont.systemFont(ofSize: 20)
        labelan.text = "ან"
        self.view.addSubview(labelan)
        
        let buttonggl = UIButton(frame: CGRect(x: 20, y: 690, width: 352, height: 50))
        buttonggl.backgroundColor = UIColor.systemGray4
        buttonggl.setTitle("🇬შებრძანდით გუგლით", for: .normal)
        buttonggl.setTitleColor(.black, for: .normal)
        buttonggl.titleLabel?.textColor = UIColor.black
        self.view.addSubview(buttonggl)
        
        let buttonfb = UIButton(frame: CGRect(x: 20, y: 755, width: 352, height: 50))
        buttonfb.backgroundColor = UIColor.systemGray4
        buttonfb.setTitle("🇫შებრძანდით ფეისბუქით", for: .normal)
        buttonfb.setTitleColor(.black, for: .normal)
        self.view.addSubview(buttonfb)
        
        
    }
    
    func someImageViewConstrains() {
        someImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        someImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 148).isActive = true
        someImageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        someImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    func configureStackView() {
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 2.0
    
        stackView.backgroundColor = .white
        
        setStackViewConstraints()
    }
        
        func setStackViewConstraints() {
            
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 85).isActive = true
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
            stackView.trailingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
            stackView.widthAnchor.constraint(equalToConstant: 335).isActive = true
            
            stackView.spacing = 1.0
        }
    
    
    func stackViewItems() {
        let firstLabel = UILabel()
        firstLabel.font = UIFont.systemFont(ofSize: 25)
        let secondLabel = UILabel()
        let clearView = UIView()
        firstLabel.text = "მოგესალმებით!"
        secondLabel.text = "ამ აპლიკაციის გამოყენების საუკეთესო გზა თქვენს ანგარიშზე შესვლაა, თუ არ გაქვთ ანგარიში გააკეთეთ, თუ არ გსურთ გაკეთება დასტოვეთ აქაურობა და წაშალეთ აპლიკაცია."
        clearView.translatesAutoresizingMaskIntoConstraints = false
        clearView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        clearView.heightAnchor.constraint(equalToConstant: 5).isActive = true
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        
        secondLabel.numberOfLines = 0
        stackView.addArrangedSubview(firstLabel)
        stackView.addArrangedSubview(clearView)
        stackView.addArrangedSubview(secondLabel)
    }
    
    func configureStackView1() {
        view.addSubview(stackView1)
        stackView1.axis = .vertical
        stackView1.distribution = .fill
        stackView1.spacing = 2.0
    
        stackView1.backgroundColor = .white
        
        setStackViewConstraints1()
    }
        
    func setStackViewConstraints1() {
        
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 295).isActive = true
        stackView1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView1.trailingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        stackView1.widthAnchor.constraint(equalToConstant: 335).isActive = true
        
        stackView.spacing = 1.0
    }
    
    func stackViewItems1() {
        let label1 = UILabel()
        let textfield1 = UITextField()
        let label2 = UILabel()
        let textfield2 = UITextField()
        let label3 = UILabel()
        let textfield3 = UITextField()
        
        label1.text = "სრული სახელი"
        textfield1.placeholder = "მაგ: თეკლა სვიფტი"
        label2.text = "ელ.ფოსტა"
        textfield2.placeholder = "მაგ: dabidubi@mail.ru"
        label3.text = "პაროლი"
        textfield3.placeholder = "მაგ: davigale112, mofiqrebistaviarmaq3"
        
        stackView1.addArrangedSubview(label1)
        stackView1.addArrangedSubview(textfield1)
        stackView1.addArrangedSubview(label2)
        stackView1.addArrangedSubview(textfield2)
        stackView1.addArrangedSubview(label3)
        stackView1.addArrangedSubview(textfield3)
        
        textfield1.layer.cornerRadius = 5
        textfield1.layer.borderWidth = 1
        textfield1.layer.borderColor = UIColor.lightGray.cgColor
        textfield1.heightAnchor.constraint(equalToConstant: 44).isActive = true
        textfield1.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 20).isActive = true
        
        textfield2.layer.cornerRadius = 5
        textfield2.layer.borderWidth = 1
        textfield2.layer.borderColor = UIColor.lightGray.cgColor
        textfield2.heightAnchor.constraint(equalToConstant: 44).isActive = true
        textfield2.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 20).isActive = true
        
        textfield3.layer.cornerRadius = 5
        textfield3.layer.borderWidth = 1
        textfield3.layer.borderColor = UIColor.lightGray.cgColor
        textfield3.heightAnchor.constraint(equalToConstant: 44).isActive = true
        textfield3.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 20).isActive = true
        
    }
    

    
    
    }
    
    
    
    



#Preview {
    ViewController()
}
