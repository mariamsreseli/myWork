//
//  SceneDelegate.swift
//  davaleba-23
//
//  Created by Mariam Sreseli on 5/3/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.rootViewController = catPageVC()
        window?.makeKeyAndVisible()
    }
    
}
