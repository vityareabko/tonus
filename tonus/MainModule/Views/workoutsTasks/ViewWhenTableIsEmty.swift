//
//  ViewWhenTableIsEmty.swift
//  tonus
//
//  Created by Витя Рябко on 24/02/23.
//

import UIKit

class ViewWhenTableIsEmty: UIView {
    
    
    // MARK: - UI Components
    
    private let imagePeople = UIImageView(nameImage: "People")
    private let title = UILabel(text: "NO TRAINING", textColor: .specialGray, font: .robotoMedium36()!)
    private let subTitle = UILabel(text: "press the plus button", textColor: .specialGray, font: .robotoMedium18()!)

    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup UI
    
    private func setupUI() {
        subTitle.textAlignment = .right
        
        self.addSubview(imagePeople)
        self.addSubview(title)
        self.addSubview(subTitle)
    
        imagePeople.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        subTitle.translatesAutoresizingMaskIntoConstraints = false
    
        setConstraints()
    }
}

// MARK: - Extensions

extension ViewWhenTableIsEmty {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imagePeople.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
            imagePeople.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imagePeople.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6),
            imagePeople.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5),
            
            title.topAnchor.constraint(equalTo: self.imagePeople.bottomAnchor, constant: 13),
            title.leadingAnchor.constraint(equalTo: imagePeople.leadingAnchor, constant: -25),
            title.trailingAnchor.constraint(equalTo: imagePeople.trailingAnchor, constant: 20),
            
            subTitle.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 0),
            subTitle.trailingAnchor.constraint(equalTo: imagePeople.trailingAnchor, constant: 25),
            subTitle.leadingAnchor.constraint(equalTo: imagePeople.leadingAnchor, constant: -20),
        ])
    }
}
