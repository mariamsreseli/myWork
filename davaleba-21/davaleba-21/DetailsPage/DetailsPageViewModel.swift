//
//  DetailsPageViewModel.swift
//  davaleba-21
//
//  Created by Mariam Sreseli on 4/25/24.
//

class CountryDetailsViewModel {
    private var country: country

    init(country: country) {
        self.country = country
    }

    var flagURL: String? {
        return country.flags?.png
    }

    var flagInfoText: String? {
        return country.flags?.alt
    }
}
