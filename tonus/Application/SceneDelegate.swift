//
//  SceneDelegate.swift
//  tonus
//
//  Created by Витя Рябко on 20/02/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
 
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let vc = MainViewController()
//        let vc = StatisticsViewController()
        
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }

}

