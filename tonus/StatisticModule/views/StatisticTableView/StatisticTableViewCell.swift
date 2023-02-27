//
//  StatisticTableViewCell.swift
//  tonus
//
//  Created by Витя Рябко on 25/02/23.
//

import UIKit

class StatisticTableViewCell: UITableViewCell {

    static let identifier = "StatisticTableCell"
    
    // MARK: - Variables
    let stackView = UIStackView()
    
    // MARK: - UI Components
    private let cellTitleLabel = UILabel(text: "Biceps",
                                         textColor: .specialGray,
                                         font: .robotoBold24()!)
    private let cellSubtitleBeforeLable = UILabel(text: "Before 18",
                                                  textColor: .specialLightBrown,
                                                  font: .robotoMedium14()!)
    private let cellSubtitleNowLable = UILabel(text: "Now 20",
                                               textColor: .specialLightBrown,
                                               font: .robotoMedium14()!)
    private let cellCountLable = UILabel(text: "0",
                                         textColor: .specialYellow,
                                         font: .robotoMedium24()!)
    private let customSeparator : UIView = {
        let view = UIView()
        view.backgroundColor = .specialLine
        return view
    }()
    
    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setupUI
    
    private func setupUI() {
        self.selectionStyle = .none
        self.backgroundColor = .clear
        setStackView()
        
        self.addSubview(cellTitleLabel)
        self.addSubview(stackView)
        self.addSubview(cellCountLable)
        self.addSubview(customSeparator)
        
        cellTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        cellCountLable.translatesAutoresizingMaskIntoConstraints = false
        customSeparator.translatesAutoresizingMaskIntoConstraints = false
        
        setConstraints()
    }
    
    private func setStackView(){
        stackView.addArrangedSubview(cellSubtitleNowLable)
        stackView.addArrangedSubview(cellSubtitleBeforeLable)
        stackView.axis = .horizontal
        stackView.spacing = 10
    }
}


// MARK: - Extensions

extension StatisticTableViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            cellTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            cellTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            cellTitleLabel.trailingAnchor.constraint(equalTo: cellCountLable.leadingAnchor, constant: -10),
            
            stackView.topAnchor.constraint(equalTo: cellTitleLabel.bottomAnchor, constant: 3),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: customSeparator.topAnchor, constant: -10),

            cellCountLable.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            cellCountLable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            cellCountLable.widthAnchor.constraint(equalToConstant: 30),

            customSeparator.heightAnchor.constraint(equalToConstant: 1),
            customSeparator.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            customSeparator.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            customSeparator.trailingAnchor.constraint(equalTo: self.trailingAnchor),            
        
        ])
    }
}

