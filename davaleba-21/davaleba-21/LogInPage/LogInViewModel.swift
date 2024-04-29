//
//  LogInViewModel.swift
//  davaleba-21
//
//  Created by Mariam Sreseli on 4/29/24.
//

import UIKit

class LogInViewModel {
    
    let serviceName = ""
    let accountName = ""
    
    var userLogIn = false
    var name = ""
    var password = ""
    var repeatPassword = ""
    
    func saveCredentials(username: String, password: String) throws {
        let passwordData = "\(username):\(password)".data(using: .utf8)!
        do {
            try KeyChain.saveData(service: serviceName, account: accountName, password: passwordData)
        } catch {
            throw error
        }
    }
    
    func loadCredentials() throws -> (username: String, password: String) {
        guard let passwordData = KeyChain.getData(service: serviceName, account: accountName) else {
            throw KeyChainError.noSuchDataFound
        }
        guard let credentialString = String(data: passwordData, encoding: .utf8),
              let separatorRange = credentialString.range(of: ":"),
              !credentialString.isEmpty else {
            throw KeyChainError.unknown
        }
        let username = String(credentialString[..<separatorRange.lowerBound])
        let password = String(credentialString[separatorRange.upperBound...])
        
        return (username, password)
    }
    
    func updateCredentials(newUsername: String, newPassword: String) throws {
        let newPasswordData = "\(newUsername):\(newPassword)".data(using: .utf8)!
        do {
            try KeyChain.updateData(password: newPasswordData, service: serviceName, account: accountName)
        } catch {
            throw error
        }
    }
    
    func isFirstLogin() -> Bool {
        let firstLogin = UserDefaults.standard.bool(forKey: "loggedIn")
        if !firstLogin {
            UserDefaults.standard.set(true, forKey: "loggedIn")
            UserDefaults.standard.synchronize()
        }
        return !firstLogin
    }
    
    func saveImage(image: UIImage) {
        let imageData = image.jpegData(compressionQuality: 1) ?? image.pngData()
        if let data = imageData {
            let filename = getDocumentsDirectory().appendingPathComponent("user.png")
            try? data.write(to: filename)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
