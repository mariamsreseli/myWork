//
//  SceneDelegate.swift
//  davaleba-24
//
//  Created by Mariam Sreseli on 5/8/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.makeKeyAndVisible()
        let vc = MainVC()
        let navController = UINavigationController(rootViewController: vc)
        window?.rootViewController = navController
    }
}
