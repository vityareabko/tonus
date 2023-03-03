//
//  NewWorkoutController.swift
//  tonus
//
//  Created by Витя Рябко on 02/03/23.
//

import UIKit

class NewWorkoutController: UIViewController {
    
//    private let titleAndCloseButtonUIView = TitleAndCloseButtonUIView(title: "NEW WORKOUT")
    
    private let titleLabel = UILabel(text: "NEW WORKOUT", textColor: .specialGray, font: .robotoMedium24()!)
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        button.addTarget(self, action: #selector(didTappedCloseButton), for: .touchUpInside)
        return button
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SAVE", for: .normal)
        button.backgroundColor = .specialLightGreen
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .robotoBold16()!
        return button
    }()
    
    
    private let workoutInputNameView = WorkoutInputNameView()
    private let dateAndRepeatView = DateAndRepeatView()
    private let repsOrTimerView = RepsOrTimerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        self.view.backgroundColor = .specialMainBackground
               
//        titleAndCloseButtonUIView.clouser = { [weak self] in
//            print(1)
//            self?.dismiss(animated: true)
//        }

        self.view.addSubview(titleLabel)
        self.view.addSubview(closeButton)
        self.view.addSubview(workoutInputNameView)
        self.view.addSubview(dateAndRepeatView)
        self.view.addSubview(repsOrTimerView)
        self.view.addSubview(saveButton)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        workoutInputNameView.translatesAutoresizingMaskIntoConstraints = false
        dateAndRepeatView.translatesAutoresizingMaskIntoConstraints = false
        repsOrTimerView.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        setConstraints()
    }
    
    @objc private func didTappedCloseButton(){
        print("tap")
        dismiss(animated: true)
    }
}

extension NewWorkoutController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            closeButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.08),
            closeButton.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.08),

            workoutInputNameView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
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
