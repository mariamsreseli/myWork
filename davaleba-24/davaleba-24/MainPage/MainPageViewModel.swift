//
//  MainPageViewModel.swift
//  davaleba-24
//
//  Created by Mariam Sreseli on 5/8/24.
//


import Foundation

class MainViewModel {
    private let urlString = "https://api.unsplash.com/photos?page=1&client_id=RSUVCsP6pol33evDs6kVJ46qoXIsmQ164rKpZegTnr8&per_page=100"
    
    var photos: [Photo] = []
    
    func fetchPhotos(completion: @escaping (Result<[Photo], Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Error", code: 0, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? NSError(domain: "error", code: 0, userInfo: nil)))
                return
            }
            do {
                let jsonResult = try JSONDecoder().decode([Photo].self, from: data)
                self?.photos = jsonResult
                completion(.success(jsonResult))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
