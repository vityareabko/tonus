//
//  WorkoutTasksTableView.swift
//  tonus
//
//  Created by Витя Рябко on 24/02/23.
//

import UIKit

class WorkoutTasksTableView : UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: style)
        register(WorkoutTasksTableViewCell.self, forCellReuseIdentifier: WorkoutTasksTableViewCell.identifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .clear
        self.separatorStyle = .none
        self.bounces = false
        self.showsVerticalScrollIndicator = false
        
        
        
        self.dataSource = self
        self.delegate = self
        
        //    self.view.addSubview(<#T##UIView#>)
        //    <#T##UIView#>.translatesAutoresizingMaskIntoConstraints = false
        
        setConstraints()
        
    }
}

extension WorkoutTasksTableView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            //            <#T##UIView#>.topAnchor.constraint(equalTo: self.view.topAnchor),
            //            <#T##UIView#>.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            //            <#T##UIView#>.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            //            <#T##UIView#>.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            //
            //            <#T##UIView#>.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            //            <#T##UIView#>.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            //            <#T##UIView#>.widthAnchor.constraint(equalToConstant: <#T##CGFloat#>),
            //            <#T##UIView#>.heightAnchor.constraint(equalToConstant: <#T##CGFloat#>),
        ])
    }
}

extension WorkoutTasksTableView : UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        115
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WorkoutTasksTableViewCell.identifier, for: indexPath)
        
        return cell
    }
    
    
}

extension WorkoutTasksTableView : UITableViewDelegate {
    
}

