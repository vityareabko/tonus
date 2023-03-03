//
//  StatisticTableView.swift
//  tonus
//
//  Created by Витя Рябко on 25/02/23.
//

import UIKit

class StatisticTableView : UITableView {
    
    // MARK: - Init
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: style)
        register(StatisticTableViewCell.self, forCellReuseIdentifier: StatisticTableViewCell.identifier)
        self.dataSource = self
        self.delegate = self
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    
    private func config(){
        self.backgroundColor = .none
        self.separatorStyle = .none
        self.showsVerticalScrollIndicator = false
    }
}

// MARK: - Extensions

extension StatisticTableView : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StatisticTableViewCell.identifier, for: indexPath) as? StatisticTableViewCell else {
            fatalError("The table view could not dequeue a StatisticTableViewCell in StatisticTableView")
        }
      
        return cell
    }
}

extension StatisticTableView : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("DEBUG PRINT:", indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
}


