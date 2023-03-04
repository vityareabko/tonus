//
//  NewWorkoutController.swift
//  tonus
//
//  Created by Витя Рябко on 02/03/23.
//

import UIKit

class NewWorkoutController: UIViewController {
    
    private let titleAndCloseButtonUIView = TitleAndCloseButtonUIView(title: "NEW WORKOUT")
    
    private let saveButton = UIButton(text: "SAVE",
                                      bagroungColor: .specialLightGreen,
                                      textColor: .white)
    
    
    private let workoutInputNameView = WorkoutInputNameView()
    private let dateAndRepeatView = DateAndRepeatView()
    private let repsOrTimerView = RepsOrTimerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        self.view.backgroundColor = .specialMainBackground
               
        titleAndCloseButtonUIView.clouser = { [weak self] in
            self?.dismiss(animated: true)
        }

        self.view.addSubview(titleAndCloseButtonUIView)
        self.view.addSubview(workoutInputNameView)
        self.view.addSubview(dateAndRepeatView)
        self.view.addSubview(repsOrTimerView)
        self.view.addSubview(saveButton)
        titleAndCloseButtonUIView.translatesAutoresizingMaskIntoConstraints = false
        workoutInputNameView.translatesAutoresizingMaskIntoConstraints = false
        dateAndRepeatView.translatesAutoresizingMaskIntoConstraints = false
        repsOrTimerView.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        setConstraints()
    }
    
    @objc private func didTappedCloseButton(){
        dismiss(animated: true)
    }
}

extension NewWorkoutController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleAndCloseButtonUIView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleAndCloseButtonUIView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            titleAndCloseButtonUIView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            titleAndCloseButtonUIView.heightAnchor.constraint(equalToConstant: 30),
            
            workoutInputNameView.topAnchor.constraint(equalTo: titleAndCloseButtonUIView.bottomAnchor, constant: 5),
            workoutInputNameView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            workoutInputNameView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            workoutInputNameView.heightAnchor.constraint(equalToConstant: 60),
            
            dateAndRepeatView.topAnchor.constraint(equalTo: workoutInputNameView.bottomAnchor, constant: 15),
            dateAndRepeatView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            dateAndRepeatView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            dateAndRepeatView.heightAnchor.constraint(equalToConstant: 120),
            
            repsOrTimerView.topAnchor.constraint(equalTo: dateAndRepeatView.bottomAnchor, constant: 15),
            repsOrTimerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            repsOrTimerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            repsOrTimerView.heightAnchor.constraint(equalToConstant: 295),
            
            saveButton.topAnchor.constraint(equalTo: repsOrTimerView.bottomAnchor, constant: 15),
            saveButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
