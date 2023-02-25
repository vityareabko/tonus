//
//  WorkoutTasksTableViewCell.swift
//  tonus
//
//  Created by Витя Рябко on 24/02/23.
//

import UIKit

class WorkoutTasksTableViewCell : UITableViewCell {
    
    static let identifier = "workoutTableCell"
    
    let stackView = UIStackView()
    
    private var bagroundCell: UIView = {
        let view = UIView()
        view.backgroundColor = .specialBrown
        view.layer.cornerRadius = 20
        return view
    }()


    
    private let workoutTypeTaskIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "sunny")?.withTintColor(.black, renderingMode: .alwaysOriginal)
//        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let bagroundIcon: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9294117647, blue: 0.8862745098, alpha: 1)
        view.layer.cornerRadius = 20
        return view
    }()

    private let titleTask: UILabel = {
        let label = UILabel()
        label.textColor = .specialBlack
        label.textAlignment = .left
        label.font = .robotoMedium22()
        label.text = "Pull Ups"
        return label
    }()
    
    private let subTitleReps: UILabel = {
        let label = UILabel()
        label.textColor = .specialGray
        label.textAlignment = .left
        label.font = .robotoMedium16()
        label.text = "Reps. 10"
        return label
    }()
    
    private lazy var subTitleSets: UILabel = {
        let label = UILabel()
        label.textColor = .specialGray
        label.textAlignment = .left
        label.font = .robotoMedium16()
        label.text = "Sets 2"
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("START", for: .normal)
        button.backgroundColor = .specialYellow
        button.titleLabel?.font = .robotoBold16()
        button.layer.cornerRadius = 10
        button.addShadowOnView()
        button.addTarget(self, action: #selector(didTappedStart), for: .touchUpInside)
        return button
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        
        self.addSubview(bagroundCell)
        self.addSubview(bagroundIcon)
        bagroundIcon.addSubview(workoutTypeTaskIcon)
        self.addSubview(titleTask)
        self.addSubview(subTitleReps)
        self.addSubview(subTitleSets)
        self.addSubview(button)
        
        self.contentView.addSubview(button)
        
        stackViewTask()
        
        bagroundCell.translatesAutoresizingMaskIntoConstraints = false
        bagroundIcon.translatesAutoresizingMaskIntoConstraints = false
        workoutTypeTaskIcon.translatesAutoresizingMaskIntoConstraints = false
        titleTask.translatesAutoresizingMaskIntoConstraints = false
        subTitleReps.translatesAutoresizingMaskIntoConstraints = false
        subTitleSets.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        setConstraints()
    }
    
    private func stackViewTask(){
        stackView.addArrangedSubview(subTitleReps)
        stackView.addArrangedSubview(subTitleSets)
        stackView.axis = .horizontal
        stackView.spacing = 10
        
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    @objc private func didTappedStart(){
        print("DEBUG PRINT:", "did tapped")
    }
    
}

extension WorkoutTasksTableViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            bagroundCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            bagroundCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            bagroundCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            bagroundCell.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
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
            
            stackView.topAnchor.constraint(equalTo: titleTask.bottomAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: bagroundIcon.trailingAnchor, constant: 10),
//            stackView.trailingAnchor.constraint(equalTo: bagroundCell.trailingAnchor, constant: -10),
//            stackView.heightAnchor.constraint(equalToConstant: 20),
            stackView.bottomAnchor.constraint(equalTo: button.topAnchor),
            
            button.topAnchor.constraint(equalTo: subTitleReps.bottomAnchor, constant: 3),
            button.leadingAnchor.constraint(equalTo: bagroundIcon.trailingAnchor, constant: 10),
            button.trailingAnchor.constraint(equalTo: bagroundCell.trailingAnchor, constant: -10),
            button.heightAnchor.constraint(equalTo: bagroundCell.widthAnchor, multiplier: 0.07),

             
            
        ])
    }
}
