//
//  ViewController.swift
//  davaleba-24
//
//  Created by Mariam Sreseli on 5/8/24.
//
//

import UIKit

class MainVC: UIViewController {
    private var collectionView: UICollectionView!
    private var viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        fetchPhotos()
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.size.width/3, height: view.frame.size.width/3)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
    }
    
    func fetchPhotos() {
        viewModel.fetchPhotos { [weak self] result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
                
            case .failure(_):
                print("")
            }
        }
    }
}

// MARK: - Extensions

extension MainVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PhotoCell else {
            fatalError("error")
        }
        let photo = viewModel.photos[indexPath.item]
        cell.configure(with: photo)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        
        return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedPhoto = viewModel.photos[indexPath.item]
        let detailVC = DetailViewController()
        detailVC.detailsViewModel = DetailViewModel()
        detailVC.detailsViewModel?.selectedPhoto = selectedPhoto
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: ჩემი კომენტარი💫
// diffable datasource რომ გამოვიყენე იმდენი რაღაც დამიერორდა, სამწუხაროდ ძველ მეთოდს მივყევი :(
// headerView-ს ცალკე გვერდი აქვს და რასაც ვუყურე ესე აკეთებდნენ მაგრამ არ გამოდის, არ ჩანს მაინც ეკრანზე 😕
// ასევე, რა არ ვცადე რომ მეორე გვერდზე გადავსულიყავი, მაგრამ არ მუშაობს ჩემი ნავიგატორი, ვერაფრით მივხვდი რატო და ამასთან დაკავშირებით რჩევას მივიღებდი, რა დავაკელი <3
//საბოლოო ჯამში ძაალიან ბევრი ვეწვალე ამ დავალებას, მაგრამ არ მომწონს 🫤🫠
