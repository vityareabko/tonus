//
//  WrapperSliderAndLabelView.swift
//  tonus
//
//  Created by Витя Рябко on 03/03/23.
//

import UIKit

class WrapperSliderAndLabelView : UIView {
    
    let slider = UIGreenSlider()
    private let nameLabel = UILabel(text: "",
                                    textColor: .specialGray,
                                    font: .robotoMedium18()!)
    let currentValueSliderLabel = UILabel(text: "",
                                             textColor: .specialGray,
                                             font: .robotoMedium24()!)
    
    private var stackView = UIStackView()
    
    init(name: String, minValue: Float, maxValue: Float){
        super.init(frame: .zero)
        
        nameLabel.text = name
        currentValueSliderLabel.text = String(Int(maxValue * 0.5))
        print(maxValue * 0.5)
        self.slider.minimumValue = minValue
        self.slider.maximumValue = maxValue
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        let stackViewForLabel = UIStackView(arrangedSubviews: [nameLabel, currentValueSliderLabel],
                                            axis: .horizontal,
                                            spacing: 10)

        stackView = UIStackView(arrangedSubviews: [stackViewForLabel, slider],
                                axis: .vertical,
                                spacing: 3)

        stackViewForLabel.distribution = .equalSpacing
        
        self.addSubview(stackView)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        currentValueSliderLabel.translatesAutoresizingMaskIntoConstraints = false
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        setConstraints()
    }
}

extension WrapperSliderAndLabelView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
    }
}
