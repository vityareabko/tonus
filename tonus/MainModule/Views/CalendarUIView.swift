//
//  CalendarUIView.swift
//  tonus
//
//  Created by Витя Рябко on 20/02/23.
//

import UIKit

class CalendarUIView: UIView {
    
    private let callendarCollection = CalendarCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        self.backgroundColor = .specialLightGreen
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(callendarCollection)
        callendarCollection.translatesAutoresizingMaskIntoConstraints = false
        

    }
    
}

extension CalendarUIView {

    private func setConstraints() {
        NSLayoutConstraint.activate([
            callendarCollection.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            callendarCollection.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            callendarCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 105),
            callendarCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            
//            callendarCollection.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
//            <#T##UIView#>.widthAnchor.constraint(equalToConstant: <#T##CGFloat#>),
//            <#T##UIView#>.heightAnchor.constraint(equalToConstant: <#T##CGFloat#>),
        ])
    }
}
