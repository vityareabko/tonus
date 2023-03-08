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
        tabBar.tintColor = .specialDarkGreen
        tabBar.unselectedItemTintColor = .specialGray
        tabBar.layer.borderWidth = 2
        tabBar.layer.borderColor = UIColor.specialLightBrown.cgColor
        tabBar.bounds = tabBar.bounds.insetBy(dx: 0, dy: -3)
    }
    
    private func setupItems(){
        let mainVC = MainViewController()
        let statisticVC = StatisticsViewController()
        
        self.setViewControllers([mainVC, statisticVC], animated: true)
        
        guard let items = tabBar.items else { return }
        
        items[0].title = "Main"
        items[1].title = "Statistic"
        
        items[0].image = UIImage(named: "main")
        items[1].image = UIImage(named: "statistic")
        
        UITabBarItem.appearance().setTitleTextAttributes([.font : UIFont.robotoBold12()!], for: .normal)
    }
}
