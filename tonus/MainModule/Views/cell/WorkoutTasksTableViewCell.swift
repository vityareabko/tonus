//
//  WorkoutTasksTableViewCell.swift
//  tonus
//
//  Created by Витя Рябко on 24/02/23.
//

import UIKit




class WorkoutTasksTableViewCell : UITableViewCell {
    
    // MARK: - Variables
    static let identifier = "workoutTableCell"
    
    // MARK: - UI Components
    
    private var workoutTypeTaskIcon = UIImageView(nameImage: "sunny")
    private var titleTask = UILabel(text: "Pull Ups", textColor: .specialBlack, font: .robotoMedium22())
    private var subTitleReps = UILabel(text: "Reps. 10", textColor: .specialGray, font: .robotoMedium16())
    private var subTitleSets = UILabel(text: "Sets 2", textColor: .specialGray, font: .robotoMedium16())
    private var stackViewSubtitle = UIStackView()
    
    public lazy var editButton : UIButton = {
        let button = UIButton(type: .system)
        let editIcon = UIImage(named: "edit")?.withTintColor(.specialDarkGreen, renderingMode: .alwaysOriginal)
        button.setImage(editIcon, for: .normal)
        return button
    }()
    
    private var bagroundCell: UIView = {
        let view = UIView()
        view.backgroundColor = .specialBrown
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let bagroundIcon: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9294117647, blue: 0.8862745098, alpha: 1)
        view.layer.cornerRadius = 20
        return view
    }()
    
    public lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("START", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .specialYellow
        button.titleLabel?.font = .robotoBold16()
        button.layer.cornerRadius = 10
        button.addShadowOnView()
        return button
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupUI
    
    private func setupUI() {
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        self.addSubview(bagroundCell)
        self.addSubview(bagroundIcon)
        bagroundIcon.addSubview(workoutTypeTaskIcon)
        self.addSubview(titleTask)
        self.addSubview(editButton)
        self.addSubview(subTitleReps)
        self.addSubview(subTitleSets)
        self.addSubview(startButton)
        
        self.contentView.addSubview(startButton) // we had put button up to the cell for user can do some action with button
        self.contentView.addSubview(editButton) // we had put button up to the cell for user can do some action with button
        
        stackViewSettings()
        
        bagroundCell.translatesAutoresizingMaskIntoConstraints = false
        bagroundIcon.translatesAutoresizingMaskIntoConstraints = false
        workoutTypeTaskIcon.translatesAutoresizingMaskIntoConstraints = false
        titleTask.translatesAutoresizingMaskIntoConstraints = false
        editButton.translatesAutoresizingMaskIntoConstraints = false
        subTitleReps.translatesAutoresizingMaskIntoConstraints = false
        subTitleSets.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        setConstraints()
    }
    
    private func stackViewSettings(){
        stackViewSubtitle = UIStackView(arrangedSubviews: [subTitleReps, subTitleSets], axis: .horizontal, spacing: 10)
//        stackViewSubtitle.distribution = .equalSpacing

        self.addSubview(stackViewSubtitle)
        stackViewSubtitle.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func setValuesOnCellComponents(titleCell : String, subTitleReps: String, subTitleSets: String, workoutImage: UIImage){
        self.titleTask.text = titleCell
        self.subTitleReps.text = subTitleReps
        self.subTitleSets.text = subTitleSets
        self.workoutTypeTaskIcon.image = workoutImage
    }

}

// MARK: - Extensions

extension WorkoutTasksTableViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            bagroundCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 7.5),
            bagroundCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            bagroundCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            bagroundCell.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -7.5),
            
            bagroundIcon.centerYAnchor.constraint(equalTo: bagroundCell.centerYAnchor),
            bagroundIcon.leadingAnchor.constraint(equalTo: bagroundCell.leadingAnchor, constant: 10),
            bagroundIcon.heightAnchor.constraint(equalTo: bagroundCell.widthAnchor, multiplier: 0.20),
            bagroundIcon.widthAnchor.constraint(equalTo: bagroundCell.widthAnchor, multiplier: 0.20),
            
            workoutTypeTaskIcon.centerYAnchor.constraint(equalTo: bagroundIcon.centerYAnchor),
            workoutTypeTaskIcon.centerXAnchor.constraint(equalTo: bagroundIcon.centerXAnchor),
            workoutTypeTaskIcon.heightAnchor.constraint(equalTo: bagroundIcon.widthAnchor, multiplier: 0.8),
            workoutTypeTaskIcon.widthAnchor.constraint(equalTo: bagroundIcon.widthAnchor, multiplier: 0.8),
            
            titleTask.topAnchor.constraint(equalTo: bagroundIcon.topAnchor, constant: 0),
            titleTask.leadingAnchor.constraint(equalTo: bagroundIcon.trailingAnchor, constant: 10),
            titleTask.trailingAnchor.constraint(equalTo: bagroundCell.trailingAnchor, constant: 10),
            
            editButton.topAnchor.constraint(equalTo: bagroundIcon.topAnchor),
            editButton.trailingAnchor.constraint(equalTo: bagroundCell.trailingAnchor, constant: -15),
            editButton.heightAnchor.constraint(equalToConstant: 20),
            editButton.widthAnchor.constraint(equalToConstant: 20),
            
            stackViewSubtitle.topAnchor.constraint(equalTo: titleTask.bottomAnchor, constant: 0),
            stackViewSubtitle.leadingAnchor.constraint(equalTo: bagroundIcon.trailingAnchor, constant: 10),
//            stackViewSubtitle.trailingAnchor.constraint(equalTo: bagroundCell.trailingAnchor, constant: -10),
            stackViewSubtitle.heightAnchor.constraint(equalToConstant: 20),
        
            startButton.topAnchor.constraint(equalTo: subTitleReps.bottomAnchor, constant: 3),
            startButton.leadingAnchor.constraint(equalTo: bagroundIcon.trailingAnchor, constant: 10),
            startButton.trailingAnchor.constraint(equalTo: bagroundCell.trailingAnchor, constant: -10),
            startButton.heightAnchor.constraint(equalTo: bagroundCell.widthAnchor, multiplier: 0.07),
        ])
    }
}
