//
//  descriptionViewController.swift
//  davaleba-15-2
//
//  Created by Mariam Sreseli on 4/10/24.
//

import UIKit

class descriptionViewController: UIViewController {

    let someImageView: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "glitter")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        return theImageView
    }()
    
    var stackView = UIStackView()
    
    let sagImage: UIImageView = {
        let oneImage = UIImageView()
        oneImage.image = UIImage(named: "icon9")
        oneImage.translatesAutoresizingMaskIntoConstraints = false
        return oneImage
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(someImageView)
        someImageViewConstrains()
        
        view.addSubview(sagImage)
        sagImageConstraints()
        
        func someImageViewConstrains() {
            someImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            someImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
            someImageView.widthAnchor.constraint(equalToConstant: 500).isActive = true
            someImageView.heightAnchor.constraint(equalToConstant: 1000).isActive = true
        }
        
        func sagImageConstraints() {
            sagImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
            sagImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 140).isActive = true
            sagImage.widthAnchor.constraint(equalToConstant: 130).isActive = true
            sagImage.heightAnchor.constraint(equalToConstant: 130).isActive = true
        }
        
        let descLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 229, height: 34))
        descLabel.center = CGPoint(x: 193, y: 270)
        descLabel.textAlignment = .center
        descLabel.text = "მშვილდოსანი"
        descLabel.textColor = .white
        descLabel.font = UIFont.boldSystemFont(ofSize: 21)
        self.view.addSubview(descLabel)
        
        let descLabel2 = UILabel()
        self.view.addSubview(descLabel2)
        descLabel2.translatesAutoresizingMaskIntoConstraints = false
        descLabel2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 230).isActive = true
        descLabel2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        descLabel2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        descLabel2.text = "მშვილდოსნის ზოდიაქოს წარმატების და იღბლის მომტანი პლანეტა იუპიტერი მფარველობს. აქედან გამომდინარე, გასაკვირი არ არის ის ფაქტი, რომ ადამიანები, რომლებიც ზოდიაქოს ამ ნიშნით მოევლინენ ქვეყანას, უსაზღვრო ოპტიმიზმითა და პოზიტიური ხასიათის თვისებებით არიან დაჯილდოვებულნლი. საზოგადოებაში, მშვილდოსნის ცნობა ძალზე მარტივია მისი საქციელის და მანერების მიხედვით. თუ ვინმე მონდომებით ყვება სასაცილო ისტორიებს, ერთად შეჯგუფებული ხალხის ეპიცენტრში ან სრულიად შემთხვევით, ფურშეტის მაგიდა ამოაყირავა და სანამ დამლაგებელი მოვა, პირდაპირ იატაკზე მოახერხა, საღამოს „ინდური ფართის“ სტილიში გაგრძელება, აუცილებლად მშვილდოსანი იქნება."
        descLabel2.textColor = .white
        descLabel2.numberOfLines = 0
        
        
        let button = UIButton(frame: CGRect(x: 20, y: 750, width: 350, height: 50))
        button.backgroundColor = UIColor.purple
        button.setTitle("პოლარული ნიშანი", for: .normal)
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(goToOpposite), for: .touchUpInside)
    }
    
    @objc func goToOpposite() {
        let oppositePg = opposite()
        navigationController?.pushViewController(oppositePg, animated: true)
        
    }
    

}

#Preview {
    descriptionViewController()
}
