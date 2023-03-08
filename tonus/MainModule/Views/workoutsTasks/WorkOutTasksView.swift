//
//  WorkOutTasksView.swift
//  tonus
//
//  Created by Витя Рябко on 24/02/23.
//

import UIKit

class WorkOutTasksView: UIView {
    
    // MARK: - Variables
    private let exerciceLabel = UILabel(text: "Workout today", textColor: .specialLightBrown, font: .robotoMedium18())
    let workoutTasksTableView = WorkoutTasksTableView()

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        self.addSubview(exerciceLabel)
        self.addSubview(workoutTasksTableView)
        exerciceLabel.translatesAutoresizingMaskIntoConstraints = false
        workoutTasksTableView.translatesAutoresizingMaskIntoConstraints = false
        setConstraints()
    }
    
}

// MARK: - Extensions

extension WorkOutTasksView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            exerciceLabel.topAnchor.constraint(equalTo: self.topAnchor),
            exerciceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            exerciceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            exerciceLabel.heightAnchor.constraint(equalToConstant: 18),
            
            workoutTasksTableView.topAnchor.constraint(equalTo: exerciceLabel.bottomAnchor, constant: 3),
            workoutTasksTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            workoutTasksTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            workoutTasksTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
}
