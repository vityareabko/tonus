//
//  DetailsWorkoutView.swift
//  tonus
//
//  Created by Витя Рябко on 13/03/23.
//

import UIKit

class DetailsWorkoutView: UIView {
    
    // MARK: - Variables
    
    
    // MARK: - UI Components
    
    private let titleDetailsLabel = UILabel(text: "Biceps", textColor: .specialGray, font: .robotoMedium24())
    private let setsLabel = UILabel(text: "Sets", textColor: .specialGray, font: .robotoMedium18())
    private let setsCountLabel = UILabel(text: "1/4", textColor: .specialGray, font: .robotoMedium24())
    private let repsLabel = UILabel(text: "Reps", textColor: .specialGray, font: .robotoMedium18())
    private let repsCountLabel = UILabel(text: "20", textColor: .specialGray, font: .robotoMedium24())
    private let nextSetButton = UIButton(text: "Next Set", bagroungColor: .specialYellow, textColor: .specialDarkGreen)
    
    private let lineSets: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8110429645, green: 0.8110429049, blue: 0.8110428452, alpha: 1)
        return view
    }()
    
    private let lineReps: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8110429645, green: 0.8110429049, blue: 0.8110428452, alpha: 1)
        return view
    }()
    
    private let editingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Editing", for: .normal)
        button.tintColor = .specialLightBrown
        button.setImage(UIImage(named: "pencil")?.withTintColor(.specialBlack, renderingMode: .alwaysOriginal), for: .normal)
        return button
    }()
    
    private var stackViewSets = UIStackView()
    private var stackViewReps = UIStackView()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI Setup
    private func setupUI() {
        self.backgroundColor = .specialBrown
        self.layer.cornerRadius = 10
        titleDetailsLabel.textAlignment = .center
        
        setStackViews()
        
        self.addSubview(titleDetailsLabel)
        self.addSubview(stackViewSets)
        self.addSubview(stackViewReps)
        self.addSubview(lineReps)
        self.addSubview(lineSets)
        self.addSubview(editingButton)
        self.addSubview(nextSetButton)
        titleDetailsLabel.translatesAutoresizingMaskIntoConstraints = false
        editingButton.translatesAutoresizingMaskIntoConstraints = false
        nextSetButton.translatesAutoresizingMaskIntoConstraints = false

        setConstraints()
    }
    
    private func setStackViews(){
        self.stackViewSets = UIStackView(arrangedSubviews: [setsLabel, setsCountLabel], axis: .horizontal, spacing: 10)
        self.stackViewReps = UIStackView(arrangedSubviews: [repsLabel, repsCountLabel], axis: .horizontal, spacing: 10)
        self.stackViewSets.distribution = .equalSpacing
        self.stackViewReps.distribution = .equalSpacing
        
        setsCountLabel.textAlignment = .right
        repsCountLabel.textAlignment = .right

        self.stackViewSets.translatesAutoresizingMaskIntoConstraints = false
        self.stackViewReps.translatesAutoresizingMaskIntoConstraints = false
        self.setsCountLabel.translatesAutoresizingMaskIntoConstraints = false
        self.repsCountLabel.translatesAutoresizingMaskIntoConstraints = false
        self.setsLabel.translatesAutoresizingMaskIntoConstraints = false
        self.repsLabel.translatesAutoresizingMaskIntoConstraints = false
        self.lineReps.translatesAutoresizingMaskIntoConstraints = false
        self.lineSets.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    // MARK: - Selectors
    
    
    
}

extension DetailsWorkoutView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleDetailsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            titleDetailsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            titleDetailsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            titleDetailsLabel.heightAnchor.constraint(equalToConstant: 25),
            
            stackViewSets.topAnchor.constraint(equalTo: titleDetailsLabel.bottomAnchor, constant: 20),
            stackViewSets.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackViewSets.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            stackViewSets.heightAnchor.constraint(equalToConstant: 25),
            
            lineSets.topAnchor.constraint(equalTo: stackViewSets.bottomAnchor, constant: 3),
            lineSets.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            lineSets.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            lineSets.heightAnchor.constraint(equalToConstant: 1),

            stackViewReps.topAnchor.constraint(equalTo: lineSets.bottomAnchor, constant: 25),
            stackViewReps.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackViewReps.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            stackViewReps.heightAnchor.constraint(equalToConstant: 25),
            
            lineReps.topAnchor.constraint(equalTo: stackViewReps.bottomAnchor, constant: 3),
            lineReps.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            lineReps.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            lineReps.heightAnchor.constraint(equalToConstant: 1),

            editingButton.topAnchor.constraint(equalTo: stackViewReps.bottomAnchor, constant: 20),
            editingButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            editingButton.widthAnchor.constraint(equalToConstant: 100),
            
            nextSetButton.topAnchor.constraint(equalTo: editingButton.bottomAnchor, constant: 10),
            nextSetButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            nextSetButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            nextSetButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
