//
//  WorkoutTasksTableView.swift
//  tonus
//
//  Created by Витя Рябко on 24/02/23.
//

import UIKit

protocol TableViewEditProtocol : AnyObject {
    func getViewController (workoutTitle: String, workoutDate: Date, workoutRepeat: Bool, reps: Int, sets: Int, timer: Int, imageName: String, indexPath: IndexPath)
}

class WorkoutTableView : UITableView {
    
    // MARK: - Variables
    let resultsDB = RealmManager.shared.realm.objects(WorkoutModel.self)
    
    weak var tableViewCellDelegate : TableViewEditProtocol?
    
    private var closureGetIndexPath : (() -> IndexPath)?
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
    
    @objc private func didTappedEditButton(sender: UIButton){
        let indexPathRow = sender.tag
        let imageName = resultsDB[indexPathRow].workoutImageName
        let titleWorkout = resultsDB[indexPathRow].titleWorkout
        let workoutDate = resultsDB[indexPathRow].workoutDate
        let workoutRepeat = resultsDB[indexPathRow].workoutRepeatEveryWeek
        let reps = resultsDB[indexPathRow].workoutReps
        let sets = resultsDB[indexPathRow].workoutSets
        let timer = resultsDB[indexPathRow].workoutTimer
        self.tableViewCellDelegate?.getViewController(workoutTitle: titleWorkout, workoutDate: workoutDate, workoutRepeat: workoutRepeat, reps: reps, sets: sets, timer: timer, imageName: imageName, indexPath: [0, indexPathRow])
    }
}

// MARK: - Extensions

extension WorkoutTableView : UITableViewDataSource{
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
        guard let dataImage = resultsDB[indexPath.row].workoutImageData else { return cell }
        guard let imageWorkout = UIImage(data: dataImage) else {return cell}
        let titleWorkout = resultsDB[indexPath.row].titleWorkout
        let subTitleReps = "Reps. \(resultsDB[indexPath.row].workoutReps)"
        let subTitleSets = "Sets. \(resultsDB[indexPath.row].workoutSets)"
        
        cell.setValuesOnCellComponents(titleCell: titleWorkout, subTitleReps: subTitleReps, subTitleSets: subTitleSets, workoutImage: imageWorkout)
    
        cell.editButton.addTarget(self, action: #selector(didTappedEditButton), for: .touchUpInside) // try after indexPath instead sender
        cell.editButton.tag = indexPath.row
        
        return cell
    }
    
}

extension WorkoutTableView : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("our cell with index at:", indexPath)
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "") { action, view, handler in
            try! RealmManager.shared.realm.write {
                RealmManager.shared.realm.delete(self.resultsDB[indexPath.row])
                self.reloadData()
            }
        }
       
        deleteAction.backgroundColor = UIColor.init(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.0)
        deleteAction.image = UIImage(systemName: "trash")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        return UISwipeActionsConfiguration(actions: [deleteAction])
        
    }
}

