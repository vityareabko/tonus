//
//  SliderView.swift
//  tonus
//
//  Created by Витя Рябко on 03/03/23.
//

import UIKit


protocol SliderViewProtocol : AnyObject {
    func changeValue(type: SlideType, value: Int)
}

class SliderView : UIView {
    
    weak var delegate : SliderViewProtocol?
    
    private lazy var slider = UIGreenSlider()
    
    private let nameLabel = UILabel(text: "",
                                    textColor: .specialGray,
                                    font: .robotoMedium18())
    private let currentValueSliderLabel = UILabel(text: "",
                                             textColor: .specialGray,
                                             font: .robotoMedium24())
    
    private var stackView = UIStackView()
    private var sliderType: SlideType?
    
    public var isActive: Bool = true {
        didSet{
            if self.isActive {
                nameLabel.alpha = 1
                currentValueSliderLabel.alpha = 1
                slider.alpha = 1
            }else {
                nameLabel.alpha = 0.5
                currentValueSliderLabel.alpha = 0.5
                slider.alpha = 0.5
                currentValueSliderLabel.text = "0"
                slider.value = 0
            }
        }
    }
    
    init(name: String, minValue: Float, maxValue: Float, sliderType: SlideType){
        super.init(frame: .zero)
        nameLabel.text = name
        currentValueSliderLabel.text = "\(Int(0))"
        self.slider.minimumValue = minValue
        self.slider.maximumValue = maxValue
        self.slider.value = 0
        self.slider.addTarget(self, action: #selector(didChangedValueSlider), for: .valueChanged)
        self.sliderType = sliderType
        
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
    
    
    public func didSetValue(type: SlideType, value: Int) {
        self.slider.value = Float(value)
        self.currentValueSliderLabel.text = "\(value)"
        
        switch type {
        case .sets,.reps:
            self.currentValueSliderLabel.text = "\(value)"
        case .timer:
            self.currentValueSliderLabel.text = "\(value.getTimeFromSecond())"
        }
        
    }
    
    
    @objc private func didChangedValueSlider() {
        currentValueSliderLabel.text = sliderType == .timer ? "\(Int(slider.value).getTimeFromSecond())" : "\(Int(slider.value))"
        guard let sliderType = sliderType else { return }
        delegate?.changeValue(type: sliderType, value: Int(slider.value))
    }
}

extension SliderView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
    }
}
