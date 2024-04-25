//
//  MainPageViewModel.swift
//  davaleba-21
//
//  Created by Mariam Sreseli on 4/25/24.
//

import UIKit

class CountryListViewModel {
    var countries: [country]

    init(countries: [country]) {
        self.countries = countries
    }

    var numberOfCountries: Int {
        return countries.count
    }

    func countryAtIndex(_ index: Int) -> country {
        return countries[index]
    }
}
