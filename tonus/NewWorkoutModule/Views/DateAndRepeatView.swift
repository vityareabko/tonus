//
//  DateAndRepeatView.swift
//  tonus
//
//  Created by Витя Рябко on 02/03/23.
//

import UIKit

class DateAndRepeatView: UIView {

    private let dateAndRepeatLabel = UILabel(text: "Date And Repeat", textColor: .specialLightBrown, font: .robotoMedium14())
    
    private let bagroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialBrown
        view.layer.cornerRadius = 10
        return view
    }()
    
    
    private let dateLabel = UILabel(text: "Date", textColor: .specialGray, font: .robotoMedium18())
    private let switchLabel = UILabel(text: "Repeat every 7 days", textColor: .specialGray, font: .robotoMedium18())
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.tintColor = .specialGray
        datePicker.backgroundColor = .none
//        datePicker.subviews[0].subviews[0].subviews[0].alpha = 0
        datePicker.tintColor = .specialLightGreen
        return datePicker
    }()
    
    private var switchReapeat: UISwitch = {
        let switchReapeat = UISwitch()
        switchReapeat.isOn = true
        switchReapeat.onTintColor = .specialLightGreen
        return switchReapeat
    }()
    
    private var dateStackView = UIStackView()
    private var switchStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .clear
        
        dateStackView = UIStackView(arrangedSubviews: [dateLabel, datePicker],
                                    axis: .horizontal,
                                    spacing: 10)
        switchStackView = UIStackView(arrangedSubviews: [switchLabel, switchReapeat],
                                  axis: .horizontal,
                                  spacing: 10)
        
        dateStackView.distribution = .equalSpacing
        switchStackView.distribution = .equalSpacing
        
        self.addSubview(dateAndRepeatLabel)
        self.addSubview(bagroundView)
        bagroundView.addSubview(dateStackView)
        bagroundView.addSubview(switchStackView)
    
        dateAndRepeatLabel.translatesAutoresizingMaskIntoConstraints = false
        bagroundView.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        switchLabel.translatesAutoresizingMaskIntoConstraints = false
        switchReapeat.translatesAutoresizingMaskIntoConstraints = false
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        setConstraints()
    }
    
    public func getContainDateAndReatView() -> (date: Date, isRepeat: Bool){
        return (datePicker.date, switchReapeat.isOn)
    }
    
    public func setContainDateAndRepeatView(date: Date, isRepeat: Bool){
        self.datePicker.date = date
        self.switchReapeat.isOn = isRepeat
    }
}

extension DateAndRepeatView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            dateAndRepeatLabel.topAnchor.constraint(equalTo: self.topAnchor),
            dateAndRepeatLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 27),
            dateAndRepeatLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -27),
            dateAndRepeatLabel.heightAnchor.constraint(equalToConstant: 16),
            
            bagroundView.topAnchor.constraint(equalTo: dateAndRepeatLabel.bottomAnchor, constant: 3),
            bagroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            bagroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            bagroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            dateStackView.centerYAnchor.constraint(equalTo: bagroundView.centerYAnchor, constant: -15),
            dateStackView.leadingAnchor.constraint(equalTo: bagroundView.leadingAnchor, constant: 10),
            dateStackView.trailingAnchor.constraint(equalTo: bagroundView.trailingAnchor, constant: -10),
            
            switchStackView.topAnchor.constraint(equalTo: bagroundView.centerYAnchor, constant: 10),
            switchStackView.leadingAnchor.constraint(equalTo: bagroundView.leadingAnchor, constant: 10),
            switchStackView.trailingAnchor.constraint(equalTo: bagroundView.trailingAnchor, constant: -20),
            
            
            
//            dateLabel.centerYAnchor.constraint(equalTo: bagroundView.centerYAnchor, constant: -20),
//            dateLabel.leadingAnchor.constraint(equalTo: bagroundView.leadingAnchor, constant: 10),
//            dateLabel.trailingAnchor.constraint(equalTo: bagroundView.trailingAnchor, constant: -10),
//
//            datePicker.centerYAnchor.constraint(equalTo: bagroundView.centerYAnchor, constant: -20),
//            datePicker.trailingAnchor.constraint(equalTo: bagroundView.trailingAnchor, constant: -10),
//
//            switchLabel.centerYAnchor.constraint(equalTo: bagroundView.centerYAnchor, constant: 20),
//            switchLabel.leadingAnchor.constraint(equalTo: bagroundView.leadingAnchor, constant: 10),
//            switchLabel.trailingAnchor.constraint(equalTo: bagroundView.trailingAnchor, constant: -10),
//
//            switchReapeat.centerYAnchor.constraint(equalTo: bagroundView.centerYAnchor, constant: 20),
//            switchReapeat.trailingAnchor.constraint(equalTo: bagroundView.trailingAnchor, constant: -20),
        
        ])
    }
}
