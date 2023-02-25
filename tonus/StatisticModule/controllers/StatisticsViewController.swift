//
//  StatisticsViewController.swift
//  tonus
//
//  Created by Витя Рябко on 25/02/23.
//

import UIKit

class StatisticsViewController: UIViewController {

    // MARK: - Variables
    
    let statisticTableView = StatisticTableView()
    
    // MARK: - UI Components
    
    let headerLabel = UILabel(text: "STATISTICS", textColor: .specialGray, font: .robotoMedium24()!)
    let exirciceLabel = UILabel(text: "Exircises", textColor: .specialLightBrown, font: .robotoMedium14()! )
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        self.view.backgroundColor = .specialMainBackground
        
        headerLabel.textAlignment = .center
        
        self.view.addSubview(headerLabel)
        self.view.addSubview(statisticTableView)
        self.view.addSubview(exirciceLabel)
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        statisticTableView.translatesAutoresizingMaskIntoConstraints = false
        exirciceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        setConstraints()
    }
}

extension StatisticsViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 35),
            headerLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            headerLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            
            // TODO: - segmentView
            
            exirciceLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 75),
            exirciceLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            exirciceLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            statisticTableView.topAnchor.constraint(equalTo: exirciceLabel.bottomAnchor, constant: 0),
            statisticTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            statisticTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            statisticTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),

        ])
    }
}
