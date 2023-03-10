//
//  CalendarUIView.swift
//  tonus
//
//  Created by Витя Рябко on 20/02/23.
//

import UIKit

class CalendarUIView: UIView {
    
    // MARK: - Variables
    
    public let callendarCollection = CalendarCollectionView()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupUI
    
    private func setupUI() {
        self.backgroundColor = .specialLightGreen
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(callendarCollection)
        callendarCollection.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

// MARK: - Extensions

extension CalendarUIView { 
    private func setConstraints() {
        NSLayoutConstraint.activate([
            callendarCollection.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            callendarCollection.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            callendarCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 105),
            callendarCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
    }
}
