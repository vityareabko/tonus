//
//  RepsOrTimerView.swift
//  tonus
//
//  Created by Витя Рябко on 02/03/23.
//

import UIKit

class RepsOrTimerView: UIView {
    
    private let repsOrTimerLabel = UILabel(text: "Reps or timer",
                                           textColor: .specialLightBrown,
                                           font: .robotoMedium14()!)
    
    private let bagroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialBrown
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let setsBlockView = WrapperSliderAndLabelView(name: "Sets",
                                                          minValue: 1,
                                                          maxValue: 10)
    
    private let repsBlockView = WrapperSliderAndLabelView(name: "Reps",
                                                          minValue: 1,
                                                          maxValue: 30)
    
    private let timerBlockView = WrapperSliderAndLabelView(name: "Timer",
                                                          minValue: 1,
                                                          maxValue: 59)
    
    private let choseRepeatOrTimerLabel = UILabel(text: "Choose repeat or timer",
                                                  textColor: .specialLightBrown,
                                                  font: .robotoMedium14()!)

    private var stackViewBlocks = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .clear
        
        stackViewBlocks = UIStackView(arrangedSubviews:
                                        [ setsBlockView,
                                          choseRepeatOrTimerLabel,
                                          repsBlockView,
                                          timerBlockView ],
                                      axis: .vertical,
                                      spacing: 15)
        stackViewBlocks.distribution = .equalSpacing
        
        choseRepeatOrTimerLabel.textAlignment = .center
        setsBlockView.slider.addTarget(self, action: #selector(didChangeSlider), for: .valueChanged)
        repsBlockView.slider.addTarget(self, action: #selector(didChangeSlider), for: .valueChanged)
        timerBlockView.slider.addTarget(self, action: #selector(didChangeSlider), for: .valueChanged)
        timerBlockView.currentValueSliderLabel.text = "1min 30 sec"
        timerBlockView.slider.value = 30
        setsBlockView.slider.value = setsBlockView.slider.maximumValue * 0.5
        repsBlockView.slider.value = repsBlockView.slider.maximumValue * 0.5
        
        self.addSubview(repsOrTimerLabel)
        self.addSubview(bagroundView)
        bagroundView.addSubview(stackViewBlocks)

        repsOrTimerLabel.translatesAutoresizingMaskIntoConstraints = false
        bagroundView.translatesAutoresizingMaskIntoConstraints = false
        setsBlockView.translatesAutoresizingMaskIntoConstraints = false
        choseRepeatOrTimerLabel.translatesAutoresizingMaskIntoConstraints = false
        repsBlockView.translatesAutoresizingMaskIntoConstraints = false
        timerBlockView.translatesAutoresizingMaskIntoConstraints = false
        
        setConstraints()
    }
    
    @objc private func didChangeSlider(sender: UISlider) {
        
        switch sender{
        case setsBlockView.slider:
            setsBlockView.currentValueSliderLabel.text = String(Int(sender.value))
        case repsBlockView.slider:
            repsBlockView.currentValueSliderLabel.text = String(Int(sender.value))
        case timerBlockView.slider:
            timerBlockView.currentValueSliderLabel.text = "1min \(Int(sender.value))sec"
        default:
            break
        }
    }
}

extension RepsOrTimerView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            repsOrTimerLabel.topAnchor.constraint(equalTo: self.topAnchor),
            repsOrTimerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 27),
            repsOrTimerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -27),
            repsOrTimerLabel.heightAnchor.constraint(equalToConstant: 16),
            
            bagroundView.topAnchor.constraint(equalTo: repsOrTimerLabel.bottomAnchor, constant: 3),
            bagroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            bagroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            bagroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            setsBlockView.heightAnchor.constraint(equalToConstant: 60),
            choseRepeatOrTimerLabel.heightAnchor.constraint(equalToConstant: 15),
            repsBlockView.heightAnchor.constraint(equalToConstant: 60),
            timerBlockView.heightAnchor.constraint(equalToConstant: 60),
            
            stackViewBlocks.topAnchor.constraint(equalTo: bagroundView.topAnchor, constant: 15),
            stackViewBlocks.leadingAnchor.constraint(equalTo: bagroundView.leadingAnchor),
            stackViewBlocks.trailingAnchor.constraint(equalTo: bagroundView.trailingAnchor),
            stackViewBlocks.bottomAnchor.constraint(equalTo: bagroundView.bottomAnchor, constant: -15),
        ])
    }
}
