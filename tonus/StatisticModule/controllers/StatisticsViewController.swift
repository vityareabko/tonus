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
    private let headerLabel = UILabel(text: "STATISTICS", textColor: .specialGray, font: .robotoMedium24())
    private let exirciceLabel = UILabel(text: "Exircises", textColor: .specialLightBrown, font: .robotoMedium14())
    
    private lazy var segmentControl : UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: ["Week", "Month"])
        segmentControl.selectedSegmentIndex = 0
        segmentControl.backgroundColor = .specialLightGreen
        segmentControl.selectedSegmentTintColor = .specialYellow
        segmentControl.setTitleTextAttributes([.font: UIFont.robotoMedium16()!, .foregroundColor: UIColor.white], for: .normal)
        segmentControl.setTitleTextAttributes([ .foregroundColor: UIColor.specialGray ], for: .selected)
        segmentControl.addTarget(self, action: #selector(didTappedSegmentControl), for: .valueChanged)
        return segmentControl
    }()
    
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
        self.view.addSubview(segmentControl)
        self.view.addSubview(statisticTableView)
        self.view.addSubview(exirciceLabel)
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        statisticTableView.translatesAutoresizingMaskIntoConstraints = false
        exirciceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        setConstraints()
    }
    
    // MARK: - Selectors
    
    @objc private func didTappedSegmentControl() {
        
        if segmentControl.selectedSegmentIndex == 0 {
            print("Week")
        } else if segmentControl.selectedSegmentIndex == 1 {
            print("Month")
        }
        
    }
    
}

// MARK: - Extensions

extension StatisticsViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 35),
            headerLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            headerLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            
            segmentControl.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            segmentControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            segmentControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            exirciceLabel.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 20),
            exirciceLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            exirciceLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            statisticTableView.topAnchor.constraint(equalTo: exirciceLabel.bottomAnchor, constant: 0),
            statisticTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            statisticTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            statisticTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),

        ])
    }
}
