//
//  StartWorkoutController.swift
//  tonus
//
//  Created by Витя Рябко on 13/03/23.
//

import UIKit

class StartWorkoutController: UIViewController {
    
    // MARK: - Variables
    
    
    // MARK: - UI Components
    private let headerTitleAndCloseButton = TitleAndCloseButtonUIView(title: "START WORKOUT")
    private let imageWorkout = UIImageView(nameImage: "startWorkout")
    private let detailsLabel = UILabel(text: "Details", textColor: .specialLightBrown, font: .robotoMedium14())
    private let detailsWorkoutView = DetailsWorkoutView()
    private let finishButton = UIButton(text: "FINISH", bagroungColor: .specialLightGreen, textColor: .white)
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        dismissController()
    }
    
    // MARK: - UI Setup
    private func setupUI() {

        self.view.backgroundColor = .specialMainBackground
        
        self.view.addSubview(headerTitleAndCloseButton)
        self.view.addSubview(imageWorkout)
        self.view.addSubview(detailsLabel)
        self.view.addSubview(detailsWorkoutView)
        self.view.addSubview(finishButton)
        headerTitleAndCloseButton.translatesAutoresizingMaskIntoConstraints = false
        imageWorkout.translatesAutoresizingMaskIntoConstraints = false
        detailsLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsWorkoutView.translatesAutoresizingMaskIntoConstraints = false
        finishButton.translatesAutoresizingMaskIntoConstraints = false
        
        setConstraints()
    }
    
    private func dismissController() {
        headerTitleAndCloseButton.clouser = { [weak self] in
            self?.dismiss(animated: true)
        }
    }
    
    
    // MARK: - Selectors
    
}

extension StartWorkoutController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            headerTitleAndCloseButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerTitleAndCloseButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerTitleAndCloseButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            headerTitleAndCloseButton.heightAnchor.constraint(equalToConstant: 30),
            
            imageWorkout.topAnchor.constraint(equalTo: headerTitleAndCloseButton.bottomAnchor, constant: 35),
            imageWorkout.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageWorkout.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6),
            imageWorkout.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            
            detailsLabel.topAnchor.constraint(equalTo: imageWorkout.bottomAnchor, constant: 25),
            detailsLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 27),
            detailsLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -22),
            detailsLabel.heightAnchor.constraint(equalToConstant: 15),

            detailsWorkoutView.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 3),
            detailsWorkoutView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            detailsWorkoutView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            detailsWorkoutView.heightAnchor.constraint(equalToConstant: 240),
            
            finishButton.topAnchor.constraint(equalTo: detailsWorkoutView.bottomAnchor, constant: 15),
            finishButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            finishButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            finishButton.heightAnchor.constraint(equalToConstant: 55),
        ])
    }
}
