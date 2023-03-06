//
//  CalendarCollectionViewCell.swift
//  tonus
//
//  Created by Витя Рябко on 23/02/23.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Variables
    
    static let identifier = "CustomCell"
    
    // MARK: - UI Components
    
    private let cellWeekDayLabel = UILabel(text: "wd", textColor: .white, font: .robotoBold16())
    private let cellNumberOfDayLabel = UILabel(text: "22", textColor: .white, font: .robotoBold20())

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Observer for status cell
    
    override var isSelected: Bool{
        didSet{
            if self.isSelected{
                self.backgroundColor = .specialYellow
                self.cellWeekDayLabel.textColor = .specialBlack
                self.cellNumberOfDayLabel.textColor = .specialDarkGreen
            } else {
                self.backgroundColor = .specialLightGreen
                self.cellWeekDayLabel.textColor = .white
                self.cellNumberOfDayLabel.textColor = .white
            }
    
        }
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        self.layer.cornerRadius = 10
        
        cellWeekDayLabel.textAlignment = .center
        cellNumberOfDayLabel.textAlignment = .center
        
        self.addSubview(cellWeekDayLabel)
        self.addSubview(cellNumberOfDayLabel)
    
        cellWeekDayLabel.translatesAutoresizingMaskIntoConstraints = false
        cellNumberOfDayLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
}

// MARK: - Extensions

extension CalendarCollectionViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            cellWeekDayLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 7),
            cellWeekDayLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            cellNumberOfDayLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -7),
            cellNumberOfDayLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
}
