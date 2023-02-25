//
//  WorkoutTasksTableView.swift
//  tonus
//
//  Created by Витя Рябко on 24/02/23.
//

import UIKit

class WorkoutTasksTableView : UITableView {
    
    
    // MARK: - Init
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: style)
        register(WorkoutTasksTableViewCell.self, forCellReuseIdentifier: WorkoutTasksTableViewCell.identifier)

        self.dataSource = self
        self.delegate = self
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupUI
    
    private func setupUI() {
        self.backgroundColor = .clear
        self.separatorStyle = .none
        self.bounces = false
        self.showsVerticalScrollIndicator = false
    }
}

// MARK: - Extensions

extension WorkoutTasksTableView : UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        115
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WorkoutTasksTableViewCell.identifier, for: indexPath)
        
        return cell
    }
}

extension WorkoutTasksTableView : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("our cell with index at:", indexPath)
    }
}

