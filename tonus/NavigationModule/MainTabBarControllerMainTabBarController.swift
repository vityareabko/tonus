//
//  MainTabBarController.swift
//  tonus
//
//  Created by Витя Рябко on 27/02/23.
//

import UIKit

class MainTabBarController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupItems()
    }
    
    private func setupTabBar(){
        tabBar.backgroundColor = .specialTabBar
        tabBar.tintColor = .specialYellow
        tabBar.unselectedItemTintColor = .white
        tabBar.layer.borderWidth = 0
        tabBar.layer.borderColor = UIColor.specialLightBrown.cgColor
        tabBar.bounds = tabBar.bounds.insetBy(dx: 0, dy: -3)
    }
    
    private func setupItems(){
        let mainVC = MainViewController()
        let statisticVC = StatisticsViewController()
        let profileVC = ProfileViewControler()
        
        self.setViewControllers([mainVC, statisticVC, profileVC], animated: true)
        
        guard let items = tabBar.items else { return }
        
        items[0].title = "Main"
        items[1].title = "Statistic"
        items[2].title = "Profile"
        
        items[0].image = UIImage(named: "main")?.withTintColor(.white, renderingMode: .alwaysTemplate)
        items[1].image = UIImage(named: "statistic")?.withTintColor(.white, renderingMode: .alwaysTemplate)
        items[2].image = UIImage(named: "profile")?.withTintColor(.white, renderingMode: .alwaysTemplate)
        
        UITabBarItem.appearance().setTitleTextAttributes([.font : UIFont.robotoBold12()!], for: .normal)
    }
}
