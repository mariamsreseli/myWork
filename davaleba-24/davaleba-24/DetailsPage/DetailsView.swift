//
//  DetailsVC.swift
//  davaleba-24
//
//  Created by Mariam Sreseli on 5/9/24.
//
import UIKit

class DetailViewController: UIViewController {
    
    var detailsViewModel: DetailViewModel!
    
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.size.width, height: view.frame.size.height)
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        collectionView.isPagingEnabled = true
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "detailCell")
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
    }
}

//MARK: - Extensions
extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detailsViewModel.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailCell", for: indexPath) as? PhotoCell else {
            fatalError("Error")
        }
        let photo = detailsViewModel.photos[indexPath.item]
        cell.configure(with: photo)
        return cell
    }
}
