//
//  StatisticTableViewCell.swift
//  tonus
//
//  Created by Витя Рябко on 25/02/23.
//

import UIKit

class StatisticTableViewCell: UITableViewCell {

    static let identifier = "StatisticTableCell"
    
    let stackView = UIStackView()
    
    private let cellTitleLabel = UILabel(text: "Biceps",
                                         textColor: .specialGray,
                                         font: .robotoBold24()!)
//    private let cellTitleLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .label
//        label.textAlignment = .left
//        label.font = .systemFont(ofSize: 12, weight: .regular)
//        label.text = "Error"
//        return label
//    }()
    
    private let cellSubtitleBeforeLable = UILabel(text: "Before 18",
                                                  textColor: .specialLightBrown,
                                                  font: .robotoMedium14()!)
//    private let cellSubtitleBeforeLable: UILabel = {
//        let label = UILabel()
//        label.textColor = .label
//        label.textAlignment = .left
//        label.font = .systemFont(ofSize: 12, weight: .regular)
//        label.text = "Error"
//        return label
//    }()
    
    private let cellSubtitleNowLable = UILabel(text: "Now 20",
                                               textColor: .specialLightBrown,
                                               font: .robotoMedium14()!)
//    private let cellSubtitleNowLable: UILabel = {
//        let label = UILabel()
//        label.textColor = .label
//        label.textAlignment = .left
//        label.font = .systemFont(ofSize: 12, weight: .regular)
//        label.text = "Error"
//        return label
//    }()
    
    private let cellCountLable = UILabel(text: "0",
                                         textColor: .specialYellow,
                                         font: .robotoMedium24()!)
//    private let cellCountLable: UILabel = {
//        let label = UILabel()
//        label.textColor = .label
//        label.textAlignment = .left
//        label.font = .systemFont(ofSize: 12, weight: .regular)
//        label.text = "Error"
//        return label
//    }()
    
    private let customSeparator : UIView = {
        let view = UIView()
        view.backgroundColor = .specialLine
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
//        self.selectionStyle = .none
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
            cellCountLable.leadingAnchor.constraint(equalTo: cellTitleLabel.trailingAnchor, constant: 10),

            customSeparator.heightAnchor.constraint(equalToConstant: 1),
            customSeparator.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            customSeparator.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            customSeparator.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
        
        ])
    }
}
