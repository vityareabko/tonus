//
//  HeaderUIView.swift
//  tonus
//
//  Created by Витя Рябко on 25/02/23.
//

import UIKit

class HeaderUIView: UIView {
    
    private let callendarCollection = CalendarCollectionView()
    private let userNameLabel = UILabel(text: "Jhon Smith", textColor: .specialGray, font: .robotoMedium24())
    public let userImage = UIImageView(nameImage: "ssss")
    
    private let backCalendarView : UIView = {
        let view = UIView()
        view.backgroundColor = .specialLightGreen
        view.layer.cornerRadius = 10
        return view
    }()
    
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
        
        self.addSubview(backCalendarView)
        backCalendarView.addSubview(callendarCollection)
        self.addSubview(userNameLabel)
        self.addSubview(userImage)
        
        userImage.translatesAutoresizingMaskIntoConstraints = false
        backCalendarView.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        callendarCollection.translatesAutoresizingMaskIntoConstraints = false

        setConstraints()
    }
    
    public func setDelegateCalendarView(_ delegate: CalendarViewProtocol){
        callendarCollection.calendarDelegate = delegate
    }
}

extension HeaderUIView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            userImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            userImage.widthAnchor.constraint(equalToConstant: 100),
            userImage.heightAnchor.constraint(equalToConstant: 100),
            
            backCalendarView.topAnchor.constraint(equalTo: userImage.centerYAnchor),
            backCalendarView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            backCalendarView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            backCalendarView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            callendarCollection.topAnchor.constraint(equalTo: backCalendarView.topAnchor, constant: 5),
            callendarCollection.bottomAnchor.constraint(equalTo: backCalendarView.bottomAnchor, constant: -5),
            callendarCollection.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 3),
            callendarCollection.trailingAnchor.constraint(equalTo: backCalendarView.trailingAnchor, constant: -10),
            
            userNameLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 5),
            userNameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6),
            userNameLabel.bottomAnchor.constraint(equalTo: userImage.centerYAnchor, constant: -20),
        ])
    }
}
