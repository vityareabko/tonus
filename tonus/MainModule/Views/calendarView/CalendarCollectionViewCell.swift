//
//  CalendarCollectionViewCell.swift
//  tonus
//
//  Created by Витя Рябко on 23/02/23.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCell"
    
    private let cellWeekDayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .robotoBold16()
        label.text = "wd"
        return label
    }()
    
    private let cellNumberOfDayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .robotoBold20()
        label.text = "22"
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    private func setupUI() {
        self.layer.cornerRadius = 10
        
        self.addSubview(cellWeekDayLabel)
        self.addSubview(cellNumberOfDayLabel)
    
        cellWeekDayLabel.translatesAutoresizingMaskIntoConstraints = false
        cellNumberOfDayLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
}

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
