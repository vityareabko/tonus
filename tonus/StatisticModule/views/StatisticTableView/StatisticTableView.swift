//
//  StatisticTableView.swift
//  tonus
//
//  Created by Витя Рябко on 25/02/23.
//

import UIKit

class StatisticTableView : UITableView {

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
    
    private func config(){
        self.backgroundColor = .none
        self.separatorStyle = .none
//        self.bounces = false
        self.showsVerticalScrollIndicator = false
        
    }
}

extension StatisticTableView : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StatisticTableViewCell.identifier, for: indexPath)

        return cell
    }
}

extension StatisticTableView : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("DEBUG PRINT:", indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        75
    }
    
}

