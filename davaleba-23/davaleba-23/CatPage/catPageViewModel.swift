//
//  catPageViewModel.swift
//  davaleba-23
//
//  Created by Mariam Sreseli on 5/3/24.
//
// CatPageViewModel.swift

import Foundation

struct CatFactsResponse: Codable {
    let data: [CatFact]
}

class CatPageViewModel {
    
    var catFacts: [CatFact] = []
    
    func fetchCatFacts(completion: @escaping ([CatFact]?, Error?) -> Void) {
        guard let url = URL(string: "https://catfact.ninja/facts") else {
            completion(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Error"]))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Error"]))
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data"]))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                //decoder.keyDecodingStrategy = .convertFromSnakeCase
                let catFactsResponse = try decoder.decode(CatFactsResponse.self, from: data)
                self.catFacts = catFactsResponse.data
                completion(self.catFacts, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}
