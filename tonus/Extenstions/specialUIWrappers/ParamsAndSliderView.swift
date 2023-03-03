//
//  ParamsAndSliderView.swift
//  tonus
//
//  Created by Витя Рябко on 03/03/23.
//

import UIKit

class ParamsAndSliderView: UIView {
    
    private let sliderLabel = UILabel(text: "",
                                      textColor: .specialGray,
                                      font: .robotoMedium18()!)
    
    private let curentSliderValueLabel = UILabel(text: "",
                                                 textColor: .specialGray,
                                                 font: .robotoMedium24()!)
    
    private let slider = UISlider()
    
    private var stackViewForLabels = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(sliderLabel: String, curentSliderValueLabel: Int, slideValue: Float, minValue: Float, maxValue: Float, minColor: UIColor, maxColor: UIColor){
        self.init()
        self.sliderLabel.text = sliderLabel
        self.curentSliderValueLabel.text = "\(curentSliderValueLabel)"
        self.slider.value = slideValue
        self.slider.minimumValue = minValue
        self.slider.maximumValue = maxValue
        self.slider.minimumTrackTintColor = minColor
        self.slider.maximumTrackTintColor = maxColor
    }
    
    private func setupUI() {
        self.backgroundColor = .clear
        
        stackViewForLabels = UIStackView(arrangedSubviews: [sliderLabel, curentSliderValueLabel], axis: .horizontal, spacing: 10)
        stackViewForLabels.distribution = .equalSpacing
        
       
        self.addSubview(stackViewForLabels)
        self.addSubview(slider)
        sliderLabel.translatesAutoresizingMaskIntoConstraints = false
        curentSliderValueLabel.translatesAutoresizingMaskIntoConstraints = false
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        setConstraints()
    }

}

extension ParamsAndSliderView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            stackViewForLabels.topAnchor.constraint(equalTo: self.topAnchor),
            stackViewForLabels.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            stackViewForLabels.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            stackViewForLabels.heightAnchor.constraint(equalToConstant: 25),
            
            slider.topAnchor.constraint(equalTo: stackViewForLabels.bottomAnchor, constant: 3),
            slider.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            slider.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            
        ])
    }
}
