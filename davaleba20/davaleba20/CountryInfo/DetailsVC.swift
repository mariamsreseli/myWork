//
//  DetailsVC.swift
//  davaleba20
//
//  Created by Mariam Sreseli on 4/22/24.
//

import UIKit

class DetailsVC: UIViewController {
    
    var flagURL: String?
    var flagInfoText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let flagImageView = UIImageView(frame: CGRect(x: 20, y: 100, width: 343, height: 228))
        view.addSubview(flagImageView)
        
        if let flagURL = flagURL, let url = URL(string: flagURL) {
            URLSession.shared.dataTask(with: url) { [weak flagImageView] data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    flagImageView?.image = UIImage(data: data)
                }
            }.resume()
            
            flagImageView.layer.cornerRadius = 10
            flagImageView.clipsToBounds = true
        }
        let googleMapsImageView = UIImageView(frame: CGRect(x: 120, y: 700, width: 50, height: 50))
        googleMapsImageView.image = UIImage(named: "google")
        googleMapsImageView.isUserInteractionEnabled = true
        view.addSubview(googleMapsImageView)
        
        let googleMapsTapGesture = UITapGestureRecognizer(target: self, action: #selector(openGoogleMaps))
        googleMapsImageView.addGestureRecognizer(googleMapsTapGesture)
        
        let openStreetMapsImageView = UIImageView(frame: CGRect(x: 220, y: 700, width: 50, height: 50))
        openStreetMapsImageView.image = UIImage(named: "street")
        openStreetMapsImageView.isUserInteractionEnabled = true
        view.addSubview(openStreetMapsImageView)
        
        let openStreetMapsTapGesture = UITapGestureRecognizer(target: self, action: #selector(openOpenStreetMap))
        openStreetMapsImageView.addGestureRecognizer(openStreetMapsTapGesture)
        
        let titleLabel = UILabel(frame: CGRect(x: 20, y: 330, width: view.frame.width - 40, height: 30))
        titleLabel.text = "About the flags:"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 21)
        view.addSubview(titleLabel)
        
        let flagInfoTextView = UITextView(frame: CGRect(x: 20, y: 370, width: view.frame.width - 40, height: 220))
        flagInfoTextView.isEditable = false
        flagInfoTextView.text = flagInfoText
        flagInfoTextView.font = UIFont.systemFont(ofSize: 17)
        view.addSubview(flagInfoTextView)
        
        let titleLabel2 = UILabel(frame: CGRect(x: 20, y: 660, width: 300, height: 30))
        titleLabel2.text = "Useful Links:"
        titleLabel2.font = UIFont.boldSystemFont(ofSize: 21)
        view.addSubview(titleLabel2)
    }
    
    @objc func openGoogleMaps() {
        if let url = URL(string: "https://goo.gl/maps/JjmyUuULujnDeFPf7") {
            UIApplication.shared.open(url)
        }
    }
    
    @objc func openOpenStreetMap() {
        if let url = URL(string: "https://www.openstreetmap.org/relation/58974") {
            UIApplication.shared.open(url)
        }
    }
}
