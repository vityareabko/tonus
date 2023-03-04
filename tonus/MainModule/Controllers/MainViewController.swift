//
//  ViewController.swift
//  tonus
//
//  Created by Витя Рябко on 20/02/23.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Variables
    
    
    
    // MARK: - UI Components
    private let header = HeaderUIView()
    private let weatherUIView = WeatherUIView()
    // let viewWhenTableIsEmty = ViewWhenTableIsEmty() // TODO: - is view whe our table is empty
    private let workOutTasksView = WorkOutTasksView()
    
    private lazy var addWorkoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialYellow
        button.tintColor = .specialDarkGreen
        button.imageEdgeInsets = .init(top: 0, left: 20, bottom: 15, right: 0)
        button.titleEdgeInsets = .init(top: 50, left: -40, bottom: 0, right: 0)
        button.titleLabel?.font = .robotoMedium12()
        button.layer.cornerRadius = 10
        button.setTitle("Add Workout", for: .normal)
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.addTarget(self, action: #selector(didTappedAddWorkoutButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLayoutSubviews() {
        header.userImage.layer.cornerRadius = header.userImage.frame.width / 2 // вызываем свойство из класса вию
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setConstraints()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.backgroundColor = .specialMainBackground

        addWorkoutButton.addShadowOnView()
        
        self.view.addSubview(header)
        self.view.addSubview(addWorkoutButton)
        self.view.addSubview(weatherUIView)
//        self.view.addSubview(viewWhenTableIsEmty)
        self.view.addSubview(workOutTasksView)
        
        
        header.translatesAutoresizingMaskIntoConstraints = false
        addWorkoutButton.translatesAutoresizingMaskIntoConstraints = false
        weatherUIView.translatesAutoresizingMaskIntoConstraints = false
//        viewWhenTableIsEmty.translatesAutoresizingMaskIntoConstraints = false
        workOutTasksView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Selectors
    
    @objc private func didTappedAddWorkoutButton(){
        let vc = NewWorkoutController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}

extension MainViewController {
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            header.heightAnchor.constraint(equalToConstant: 120),
            
            addWorkoutButton.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20),
            addWorkoutButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            addWorkoutButton.widthAnchor.constraint(equalToConstant: 80),
            addWorkoutButton.heightAnchor.constraint(equalToConstant: 80),
            
            weatherUIView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20),
            weatherUIView.leadingAnchor.constraint(equalTo: addWorkoutButton.trailingAnchor, constant: 15),
            weatherUIView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
            weatherUIView.heightAnchor.constraint(equalToConstant: 80),
            
//            viewWhenTableIsEmty.topAnchor.constraint(equalTo: weatherUIView.bottomAnchor, constant: 15),
//            viewWhenTableIsEmty.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
//            viewWhenTableIsEmty.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
//            viewWhenTableIsEmty.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50),
            
            workOutTasksView.topAnchor.constraint(equalTo: weatherUIView.bottomAnchor, constant: 0),
            workOutTasksView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            workOutTasksView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            workOutTasksView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
            
        ])
    }
}

