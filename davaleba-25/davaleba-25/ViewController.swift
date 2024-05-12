//
//  ViewController.swift
//  davaleba-25
//
//  Created by Mariam Sreseli on 5/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    let taylorImageView: UIImageView = {
        let taylorImageView = UIImageView()
        taylorImageView.image = UIImage(named: "taylor")
        taylorImageView.translatesAutoresizingMaskIntoConstraints = false
        return taylorImageView
    }()
    
    var homeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var musicButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var heartButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        return button
    }()
    
    let songLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let artistLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let iconView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 40
        view.layer.shadowColor = UIColor.white.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = .zero
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let pressButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "play.circle"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let forwardButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "forward.fill"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let backwardButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "backward.fill"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let shuffleButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "shuffle"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let repeatButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "repeat"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.trackTintColor = .gray
        progressView.progressTintColor = .systemBlue
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addConstraints()
        setupLabels()
        setupButtons()
        setupProgressBar()
    }
    
    func addConstraints() {
        view.addSubview(taylorImageView)
        view.addSubview(songLabel)
        view.addSubview(artistLabel)
        view.addSubview(iconView)
        view.addSubview(homeButton)
        view.addSubview(musicButton)
        view.addSubview(heartButton)
        view.addSubview(pressButton)
        view.addSubview(progressView)
        view.addSubview(backwardButton)
        view.addSubview(forwardButton)
        view.addSubview(shuffleButton)
        view.addSubview(repeatButton)
        
        NSLayoutConstraint.activate([
            taylorImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            taylorImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            taylorImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            taylorImageView.heightAnchor.constraint(equalTo: taylorImageView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            songLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 440),
            songLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            songLabel.widthAnchor.constraint(equalToConstant: 300),
            songLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            artistLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 470),
            artistLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            artistLabel.widthAnchor.constraint(equalToConstant: 300),
            artistLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: view.topAnchor, constant: 727),
            iconView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            iconView.widthAnchor.constraint(equalToConstant: 335),
            iconView.heightAnchor.constraint(equalToConstant: 85)
        ])
    }
    
    func setupLabels() {
        songLabel.font = UIFont.systemFont(ofSize: 22)
        songLabel.textColor = .white
        songLabel.textAlignment = .center
        songLabel.text = "So Long, London"
        
        artistLabel.font = UIFont.systemFont(ofSize: 16)
        artistLabel.textColor = .systemGray
        artistLabel.textAlignment = .center
        artistLabel.text = "Taylor Swift"
    }
        
    func setupButtons() {
        homeButton = createButton(imageName: "house", action: #selector(homeButtonTapped))
        musicButton = createButton(imageName: "music.note", action: #selector(musicButtonTapped))
        heartButton = createButton(imageName: "heart.fill", action: #selector(heartButtonTapped))
        
        iconView.addSubview(homeButton)
        iconView.addSubview(musicButton)
        iconView.addSubview(heartButton)
        
        NSLayoutConstraint.activate([
            homeButton.topAnchor.constraint(equalTo: iconView.topAnchor, constant: 20),
            homeButton.leadingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: 50),
            homeButton.widthAnchor.constraint(equalToConstant: 50),
            homeButton.heightAnchor.constraint(equalToConstant: 50),
            
            musicButton.topAnchor.constraint(equalTo: iconView.topAnchor, constant: 20),
            musicButton.leadingAnchor.constraint(equalTo: homeButton.trailingAnchor, constant: 50),
            musicButton.widthAnchor.constraint(equalToConstant:50),
            musicButton.heightAnchor.constraint(equalToConstant: 50),
            
            heartButton.topAnchor.constraint(equalTo: iconView.topAnchor, constant: 20),
            heartButton.leadingAnchor.constraint(equalTo: musicButton.trailingAnchor, constant: 50),
            heartButton.widthAnchor.constraint(equalToConstant: 50),
            heartButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        homeButton.tintColor = .white
        musicButton.tintColor = .white
        heartButton.tintColor = .white
        
        NSLayoutConstraint.activate([
            pressButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 600),
            pressButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 170),
            pressButton.widthAnchor.constraint(equalToConstant: 50),
            pressButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        NSLayoutConstraint.activate([
            backwardButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 610),
            backwardButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            backwardButton.widthAnchor.constraint(equalToConstant: 30),
            backwardButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            forwardButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 610),
            forwardButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 240),
            forwardButton.widthAnchor.constraint(equalToConstant: 30),
            forwardButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            shuffleButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 610),
            shuffleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            shuffleButton.widthAnchor.constraint(equalToConstant: 30),
            shuffleButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            repeatButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 610),
            repeatButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 280),
            repeatButton.widthAnchor.constraint(equalToConstant: 30),
            repeatButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        pressButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    @objc private func didTapButton() {
        
        pressButton.isSelected.toggle()
        
        if pressButton.isSelected {
            pressButton.setBackgroundImage(UIImage(systemName: "play.circle"), for: .normal)
        } else {
            pressButton.setBackgroundImage(UIImage(systemName: "pause.circle"), for: .normal)
        }
        
        for x in 0..<100 {
            DispatchQueue.main.asyncAfter(deadline: .now() + (Double(x) * 0.25)) {
                self.progressView.setProgress(Float(x) / 100, animated: true)
            }
        }
    }

    func createButton(imageName: String, action: Selector) -> UIButton {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: imageName), for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }

        @objc func homeButtonTapped() {
            animateButton(button: homeButton)
        }
        
        @objc func musicButtonTapped() {
            animateButton(button: musicButton)
        }
        
        @objc func heartButtonTapped() {
            animateButton(button: heartButton)
        }
        
        func animateButton(button: UIButton) {
            UIView.animate(withDuration: 0.1, animations: {
                button.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            }) { _ in
                UIView.animate(withDuration: 0.1) {
                    button.transform = .identity
                }
            }
        }
    
    func setupProgressBar() {
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: view.topAnchor, constant: 580),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            progressView.widthAnchor.constraint(equalToConstant: view.frame.size.width-20),
            progressView.heightAnchor.constraint(equalToConstant: 5)
        ])
        
        progressView.setProgress(0, animated: false)
    }
    }
    
//MARK: - ჩემი კომენტარი
// მოკლედ, რაღაცები არ გამოვიდა :( სურათის გადიდებას ვეწვალე მაგრამ არ იმუშავა, მაინც იგივე ზომის რჩებოდა. რაც გამოვიდა იქედან ერთი კითხვა მაქვს, progress bar-ში ეს ხაზი რომ ივსება, ეგ უფრო smooth-ად რომ მიდიოდეს რა უნდა ჩამემატებინა?🥹 და ასევე, ვიუ მოდელში რა უნდა გამეტანა აქედან ცოტა ავირიე...
        
        
