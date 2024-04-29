//
//  Error.swift
//  davaleba-21
//
//  Created by Mariam Sreseli on 4/29/24.
//

import Foundation

enum TextInputTypes {
    case Name
    case Password
    case PasswordRepeat
}

enum KeyChainError: Error {
    case sameItemFound
    case unknown
    case noSuchDataFound
    case keychainErrorWithCode(Int)
}
