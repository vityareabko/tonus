//
//  WorkOutTasksView.swift
//  tonus
//
//  Created by Витя Рябко on 24/02/23.
//

import UIKit

class WorkOutTasksView: UIView {

    let workoutTasksTableView = WorkoutTasksTableView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
//        self.backgroundColor = .white
        
        self.addSubview(workoutTasksTableView)
        workoutTasksTableView.translatesAutoresizingMaskIntoConstraints = false
        setConstraints()
    }
    
}

extension WorkOutTasksView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            workoutTasksTableView.topAnchor.constraint(equalTo: self.topAnchor,constant: 15),
            workoutTasksTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            workoutTasksTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            workoutTasksTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        ])
    }
}