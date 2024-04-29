//
//  DetailsPageView.swift
//  davaleba-21
//
//  Created by Mariam Sreseli on 4/25/24.
//

import UIKit

class DetailsVC: UIViewController {
    
    let titleLabel = UILabel()
    let titleLabel2 = UILabel()
    private var flagInfoText: String?
    private let flagImageView = UIImageView()
    private let flagInfoTextView = UITextView()
    private let googleMapsImageView = UIImageView()
    private let openStreetMapsImageView = UIImageView()
    private var googleMapsTapGesture: UITapGestureRecognizer!
    private var openStreetMapsTapGesture: UITapGestureRecognizer!
    private var countryDetailsViewModel: CountryDetailsViewModel!
    
    init(country: country) {
        super.init(nibName: nil, bundle: nil)
        self.countryDetailsViewModel = CountryDetailsViewModel(country: country)
        self.flagInfoText = countryDetailsViewModel.flagInfoText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupGestureRecognizers()
    }
    
    private func setupGestureRecognizers() {
        let googleMapsTapGesture = UITapGestureRecognizer(target: self, action: #selector(openGoogleMaps))
        googleMapsImageView.addGestureRecognizer(googleMapsTapGesture)
        let openStreetMapsTapGesture = UITapGestureRecognizer(target: self, action: #selector(openOpenStreetMap))
        openStreetMapsImageView.addGestureRecognizer(openStreetMapsTapGesture)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(flagImageView)
        NSLayoutConstraint.activate([
            flagImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            flagImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            flagImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            flagImageView.heightAnchor.constraint(equalToConstant: 228)
        ])
        flagImageView.contentMode = .scaleAspectFit
        
        if let flagInfoText = flagInfoText {
            flagInfoTextView.text = flagInfoText
        } else {
            flagInfoTextView.text = "Flag info not available"
        }
        
        if let flagURL = countryDetailsViewModel.flagURL, let url = URL(string: flagURL) {
            URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    self?.flagImageView.image = UIImage(data: data)
                }
            }.resume()
        }
        
        flagInfoTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(flagInfoTextView)
        NSLayoutConstraint.activate([
            flagInfoTextView.topAnchor.constraint(equalTo: flagImageView.bottomAnchor, constant: 20),
            flagInfoTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            flagInfoTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            flagInfoTextView.heightAnchor.constraint(equalToConstant: 220)
        ])
        flagInfoTextView.isEditable = false
        flagInfoTextView.text = countryDetailsViewModel.flagInfoText
        flagInfoTextView.font = UIFont.systemFont(ofSize: 17)
        
        googleMapsImageView.frame = CGRect(x: 120, y: 700, width: 50, height: 50)
        googleMapsImageView.image = UIImage(named: "google")
        googleMapsImageView.isUserInteractionEnabled = true
        view.addSubview(googleMapsImageView)
        
        
        openStreetMapsImageView.frame = CGRect(x: 220, y: 700, width: 50, height: 50)
        openStreetMapsImageView.image = UIImage(named: "street")
        openStreetMapsImageView.isUserInteractionEnabled = true
        view.addSubview(openStreetMapsImageView)
        
        titleLabel.frame = CGRect(x: 20, y: 310, width: view.frame.width - 40, height: 50)
        titleLabel.text = "About the flags:"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 21)
        view.addSubview(titleLabel)
        
        flagInfoTextView.isEditable = false
        flagInfoTextView.text = flagInfoText
        flagInfoTextView.font = UIFont.systemFont(ofSize: 17)
        view.addSubview(flagInfoTextView)
        
        titleLabel2.frame = CGRect(x: 20, y: 660, width: 300, height: 30)
        titleLabel2.text = "Useful Links:"
        titleLabel2.font = UIFont.boldSystemFont(ofSize: 21)
        view.addSubview(titleLabel2)
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Country Details"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
    }
    
    @objc private func didTapDone() {
        navigationController?.popViewController(animated: true)
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
