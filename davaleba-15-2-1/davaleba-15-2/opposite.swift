//
//  opposite.swift
//  davaleba-15-2
//
//  Created by Mariam Sreseli on 4/11/24.
//

import UIKit

class opposite: UIViewController {

    let someImageView: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "glitter")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        return theImageView
    }()
    
    var stackView = UIStackView()
    
    let gemImage: UIImageView = {
        let oneImage = UIImageView()
        oneImage.image = UIImage(named: "icon3")
        oneImage.translatesAutoresizingMaskIntoConstraints = false
        return oneImage
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(someImageView)
        someImageViewConstrains()
        
        view.addSubview(gemImage)
        gemImageConstraints()
        
        func someImageViewConstrains() {
            someImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            someImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
            someImageView.widthAnchor.constraint(equalToConstant: 500).isActive = true
            someImageView.heightAnchor.constraint(equalToConstant: 1000).isActive = true
        }
        
//        func sagImageConstraints() {
//            gemImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250).isActive = true
//            gemImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 130).isActive = true
//            gemImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
//            gemImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        func gemImageConstraints() {
                 gemImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250).isActive = true
                 gemImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 130).isActive = true
                 gemImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
                 gemImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
             
        }
        
        let descLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 229, height: 34))
        descLabel.center = CGPoint(x: 200, y: 500)
        descLabel.textAlignment = .center
        descLabel.text = "ტყუპები"
        descLabel.textColor = .white
        descLabel.font = UIFont.boldSystemFont(ofSize: 21)
        self.view.addSubview(descLabel)
        
        
        let button1 = UIButton(frame: CGRect(x: 20, y: 650, width: 350, height: 50))
        button1.backgroundColor = UIColor.red
        button1.setTitle("წითელი", for: .normal)
        self.view.addSubview(button1)
        
        let button2 = UIButton(frame: CGRect(x: 20, y: 750, width: 350, height: 50))
        button2.backgroundColor = UIColor.blue
        button2.setTitle("ლურჯი", for: .normal)
        self.view.addSubview(button2)
        
        
    }
    
}

#Preview{
    opposite()
}
