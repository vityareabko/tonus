//
//  WorkoutTasksTableView.swift
//  tonus
//
//  Created by Витя Рябко on 24/02/23.
//

import UIKit



class WorkoutTasksTableView : UITableView {
    
    
    // MARK: - Variables
    let resultsDB = RealmManager.shared.realm.objects(WorkoutModel.self)
    
    // MARK: - Init
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: style)
        register(WorkoutTasksTableViewCell.self, forCellReuseIdentifier: WorkoutTasksTableViewCell.identifier)

        self.dataSource = self
        self.delegate = self
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Config
    
    private func config() {
        self.backgroundColor = resultsDB.count == 0 ? .clear : .specialMainBackground
        self.separatorStyle = .none
        self.bounces = false
        self.showsVerticalScrollIndicator = false
        reloadDataTable()
    }
    
    public func reloadDataTable(){
        self.reloadData()
    }
    
}

// MARK: - Extensions

extension WorkoutTasksTableView : UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        115
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if resultsDB.count != 0 {
            return resultsDB.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WorkoutTasksTableViewCell.identifier, for: indexPath) as? WorkoutTasksTableViewCell else {
            fatalError("The cell could not to dequeue WorkoutTasksTableViewCell in WorkoutTasksTableView")
        }
        guard let dataImage = resultsDB[indexPath.row].workoutImage else { return cell }
        let imageWorkout = UIImage(data: dataImage)
        let titleWorkout = resultsDB[indexPath.row].titleWorkout
        let subTitleReps = resultsDB[indexPath.row].workoutReps
        let subTitleSets = resultsDB[indexPath.row].workoutSets
        
        cell.workoutTypeTaskIcon.image = imageWorkout
        cell.titleTask.text = titleWorkout
        cell.subTitleReps.text = "Reps. \(subTitleReps)"
        cell.subTitleSets.text = "Sets. \(subTitleSets)"
        
        return cell
    }
}

extension WorkoutTasksTableView : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("our cell with index at:", indexPath)
    }
    
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let pinImage =  UIImage(systemName: "pin")?.withTintColor(.orange, renderingMode: .alwaysOriginal)
        let pinFullImage =  UIImage(systemName: "pin.fill")?.withTintColor(.orange, renderingMode: .alwaysOriginal)
        
        let editAction = UIContextualAction(style: .normal, title: "") { action, view, handler in
            print("edit")
        }
        editAction.backgroundColor = UIColor.init(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.0)
        editAction.image = pinImage
        let config = UISwipeActionsConfiguration(actions: [editAction])
        
        return config
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let item = resultsDB[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "") { action, view, handler in
            try! RealmManager.shared.realm.write {
                RealmManager.shared.realm.delete(item)
                self.reloadData()
            }
        }
        
        deleteAction.backgroundColor = UIColor.init(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.0)
        deleteAction.image = UIImage(systemName: "trash")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        
        
        return config
    }
}

