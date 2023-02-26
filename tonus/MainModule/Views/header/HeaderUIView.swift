//
//  HeaderUIView.swift
//  tonus
//
//  Created by Витя Рябко on 25/02/23.
//

import UIKit

class HeaderUIView: UIView {
    
    private let calendarUIView = CalendarUIView()
    private let userNameLabel = UILabel(text: "Jhon Smith", textColor: .specialGray, font: .robotoMedium24()!)
    let userImage = UIImageView(nameImage: "")
    

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupUI() {
        self.backgroundColor = .none
        userImage.backgroundColor = .specialGray
        userImage.layer.borderColor = UIColor.white.cgColor
        userImage.layer.borderWidth = 5
        
        self.addSubview(calendarUIView)
        self.addSubview(userImage)
        self.addSubview(userNameLabel)
        
        userImage.translatesAutoresizingMaskIntoConstraints = false
        calendarUIView.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false

        setConstraints()
    }
}

extension HeaderUIView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            userImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            userImage.widthAnchor.constraint(equalToConstant: 100),
            userImage.heightAnchor.constraint(equalToConstant: 100),
            
            calendarUIView.topAnchor.constraint(equalTo: userImage.centerYAnchor),
            calendarUIView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            calendarUIView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            calendarUIView.heightAnchor.constraint(equalToConstant: 70),
            
            userNameLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 5),
            userNameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6),
            userNameLabel.bottomAnchor.constraint(equalTo: calendarUIView.topAnchor, constant: -10),
        ])
    }
}
