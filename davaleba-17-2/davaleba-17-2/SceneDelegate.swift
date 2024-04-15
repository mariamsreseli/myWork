//
//  SceneDelegate.swift
//  davaleba-17-2
//
//  Created by Mariam Sreseli on 4/15/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.makeKeyAndVisible()
        let vc = Onboarding()
        let navController = UINavigationController(rootViewController: vc)
        window?.rootViewController = navController
    }
    
}
