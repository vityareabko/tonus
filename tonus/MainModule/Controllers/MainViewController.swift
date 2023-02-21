//
//  ViewController.swift
//  tonus
//
//  Created by Витя Рябко on 20/02/23.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Variables
    let calendarUIView = CalendarUIView()
    let weatherUIView = WeatherUIView()
    
    // MARK: - UI Components
    let userImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = #colorLiteral(red: 0.8044065833, green: 0.8044064641, blue: 0.8044064641, alpha: 1)
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 5
//        let screenSize: CGRect = UIScreen.main.bounds
//        let screenWidth = screenSize.width
//        image.layer.cornerRadius = (screenWidth * 0.2) / 2
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "Jhon Smith"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        return label
    }()
    
    private lazy var addWorkoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.9963226914, green: 0.8627573252, blue: 0.4291374087, alpha: 1)
        button.tintColor = #colorLiteral(red: 0.1411764706, green: 0.2941176471, blue: 0.262745098, alpha: 1)
        button.imageEdgeInsets = .init(top: 0, left: 20, bottom: 15, right: 0)
        button.titleEdgeInsets = .init(top: 50, left: -40, bottom: 0, right: 0)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.layer.cornerRadius = 10
        button.setTitle("Add Workout", for: .normal)
        button.setImage(UIImage(named: "plus"), for: .normal)
//        button
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        userImage.layer.cornerRadius = userImage.frame.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setConstraints()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = #colorLiteral(red: 0.9437981248, green: 0.9289113879, blue: 0.8816363215, alpha: 1)
        
        
        
        self.view.addSubview(calendarUIView)
        self.view.addSubview(userImage)
        self.view.addSubview(userNameLabel)
        self.view.addSubview(addWorkoutButton)
        self.view.addSubview(weatherUIView)
        
        userImage.translatesAutoresizingMaskIntoConstraints = false
        calendarUIView.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addWorkoutButton.translatesAutoresizingMaskIntoConstraints = false
        weatherUIView.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    // MARK: - Selectors
    
}
    


extension MainViewController {
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            userImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            userImage.widthAnchor.constraint(equalToConstant: 100),
            userImage.heightAnchor.constraint(equalToConstant: 100),
            
            calendarUIView.topAnchor.constraint(equalTo: userImage.centerYAnchor),
            calendarUIView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            calendarUIView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
            calendarUIView.heightAnchor.constraint(equalToConstant: 70),
        
            userNameLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 5),
            userNameLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6),
            userNameLabel.bottomAnchor.constraint(equalTo: calendarUIView.topAnchor, constant: -10),
            
            addWorkoutButton.topAnchor.constraint(equalTo: calendarUIView.bottomAnchor, constant: 10),
            addWorkoutButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            addWorkoutButton.widthAnchor.constraint(equalToConstant: 80),
            addWorkoutButton.heightAnchor.constraint(equalToConstant: 80),
            
            weatherUIView.topAnchor.constraint(equalTo: calendarUIView.bottomAnchor, constant: 10),
            weatherUIView.leadingAnchor.constraint(equalTo: addWorkoutButton.trailingAnchor, constant: 10),
            weatherUIView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            weatherUIView.heightAnchor.constraint(equalToConstant: 80),
            
        ])
    }
}

