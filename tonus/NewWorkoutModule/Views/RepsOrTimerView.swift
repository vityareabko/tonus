//
//  RepsOrTimerView.swift
//  tonus
//
//  Created by Витя Рябко on 02/03/23.
//

import UIKit

class RepsOrTimerView: UIView {
    private let repsOrTimerLabel = UILabel(text: "Reps or timer", textColor: .specialLightBrown, font: .robotoMedium14()!)
    
    private let bagroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialBrown
        view.layer.cornerRadius = 10
        return view
    }()
//    
//    private let setView = ParamsAndSliderView(sliderLabel: "Sets", curentSliderValueLabel: 3, slideValue: 3, minValue: 1, maxValue: 10, minColor: .specialLightGreen, maxColor: .specialLightBrown)
    
    private let setsLabel = UILabel(text: "Sets", textColor: .specialGray, font: .robotoMedium18()!)
    private let setsCountLabel = UILabel(text: "", textColor: .specialGray, font: .robotoMedium24()!)
    private let choseRepeatOrTimerLabel = UILabel(text: "Choose repeat or timer", textColor: .specialLightBrown, font: .robotoMedium14()!)
    private let repsLabel = UILabel(text: "Reps", textColor: .specialGray, font: .robotoMedium18()!)
    private let repsCountLabel = UILabel(text: "", textColor: .specialGray, font: .robotoMedium24()!)
    private let timerLabel = UILabel(text: "Timer", textColor: .specialGray, font: .robotoMedium18()!)
    private let timerCountLabel = UILabel(text: "1min 30 sec", textColor: .specialGray, font: .robotoMedium24()!)
    
    private lazy var sliderSets: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 6
        slider.value = 3
        slider.minimumTrackTintColor = .specialLightGreen
        slider.tag = 0
        setsCountLabel.text = String(Int(slider.value))
        slider.addTarget(self, action: #selector(didChangeSlider), for: .valueChanged)
        return slider
    }()
    
    private lazy var sliderReps: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 30
        slider.value = 5
        slider.minimumTrackTintColor = .specialLightGreen
        slider.tag = 1
        repsCountLabel.text = String(Int(slider.value))
        slider.addTarget(self, action: #selector(didChangeSlider), for: .valueChanged)
        return slider
    }()
    
    private lazy var sliderTimer: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 30
        slider.value = 5
        slider.minimumTrackTintColor = .specialLightGreen
        slider.tag = 2
//        repsCountLabel.text = String(Int(slider.value))
        slider.addTarget(self, action: #selector(didChangeSlider), for: .valueChanged)
        return slider
    }()
    
    private var stackViewSets = UIStackView()
    private var stackViewReps = UIStackView()
    private var stackViewTimer = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .clear
        
        stackViewSets = UIStackView(arrangedSubviews: [setsLabel, setsCountLabel], axis: .horizontal, spacing: 10)
        stackViewReps = UIStackView(arrangedSubviews: [repsLabel, repsCountLabel], axis: .horizontal, spacing: 10)
        stackViewTimer = UIStackView(arrangedSubviews: [timerLabel, timerCountLabel], axis: .horizontal, spacing: 10)
        stackViewSets.distribution = .equalCentering
        stackViewReps.distribution = .equalCentering
        stackViewTimer.distribution = .equalCentering
        
        
        
        self.addSubview(repsOrTimerLabel)
        self.addSubview(bagroundView)
        bagroundView.addSubview(stackViewSets)
        bagroundView.addSubview(sliderSets)
        bagroundView.addSubview(choseRepeatOrTimerLabel)
        bagroundView.addSubview(stackViewReps)
        bagroundView.addSubview(sliderReps)
        bagroundView.addSubview(stackViewTimer)
        bagroundView.addSubview(sliderTimer)
        
        repsOrTimerLabel.translatesAutoresizingMaskIntoConstraints = false
        bagroundView.translatesAutoresizingMaskIntoConstraints = false
        setsLabel.translatesAutoresizingMaskIntoConstraints = false
        setsCountLabel.translatesAutoresizingMaskIntoConstraints = false
        sliderSets.translatesAutoresizingMaskIntoConstraints = false
        choseRepeatOrTimerLabel.translatesAutoresizingMaskIntoConstraints = false
        repsLabel.translatesAutoresizingMaskIntoConstraints = false
        repsCountLabel.translatesAutoresizingMaskIntoConstraints = false
        sliderReps.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerCountLabel.translatesAutoresizingMaskIntoConstraints = false
        sliderTimer.translatesAutoresizingMaskIntoConstraints = false
        
        
        setConstraints()
    }
    
    @objc private func didChangeSlider(sender: UISlider) {
        
        switch sender.tag{
        case 0:
            setsCountLabel.text = String(Int(sliderSets.value))
            print(sliderSets.value)
        case 1:
            repsCountLabel.text = String(Int(sliderReps.value))
            print(sliderSets.value)
        case 2:
            break
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
            
            stackViewSets.topAnchor.constraint(equalTo: bagroundView.topAnchor, constant:20),
            stackViewSets.leadingAnchor.constraint(equalTo: bagroundView.leadingAnchor, constant: 10),
            stackViewSets.trailingAnchor.constraint(equalTo: bagroundView.trailingAnchor, constant: -10),
            stackViewSets.heightAnchor.constraint(equalToConstant: 25),
            
            sliderSets.topAnchor.constraint(equalTo: stackViewSets.bottomAnchor, constant: 3),
            sliderSets.leadingAnchor.constraint(equalTo: bagroundView.leadingAnchor, constant: 10),
            sliderSets.trailingAnchor.constraint(equalTo: bagroundView.trailingAnchor, constant: -10),
            
            choseRepeatOrTimerLabel.topAnchor.constraint(equalTo: sliderSets.bottomAnchor, constant: 10),
            choseRepeatOrTimerLabel.centerXAnchor.constraint(equalTo: bagroundView.centerXAnchor),
            
            stackViewReps.topAnchor.constraint(equalTo: choseRepeatOrTimerLabel.bottomAnchor, constant: 3),
            stackViewReps.leadingAnchor.constraint(equalTo: bagroundView.leadingAnchor, constant: 10),
            stackViewReps.trailingAnchor.constraint(equalTo: bagroundView.trailingAnchor, constant: -10),
            stackViewReps.heightAnchor.constraint(equalToConstant: 25),
            
            sliderReps.topAnchor.constraint(equalTo: stackViewReps.bottomAnchor, constant: 3),
            sliderReps.leadingAnchor.constraint(equalTo: bagroundView.leadingAnchor, constant: 10),
            sliderReps.trailingAnchor.constraint(equalTo: bagroundView.trailingAnchor, constant: -10),
            
            stackViewTimer.topAnchor.constraint(equalTo: sliderReps.bottomAnchor, constant: 15),
            stackViewTimer.leadingAnchor.constraint(equalTo: bagroundView.leadingAnchor, constant: 10),
            stackViewTimer.trailingAnchor.constraint(equalTo: bagroundView.trailingAnchor, constant: -10),
            stackViewTimer.heightAnchor.constraint(equalToConstant: 25),
            
            sliderTimer.topAnchor.constraint(equalTo: stackViewTimer.bottomAnchor, constant: 3),
            sliderTimer.leadingAnchor.constraint(equalTo: bagroundView.leadingAnchor, constant: 10),
            sliderTimer.trailingAnchor.constraint(equalTo: bagroundView.trailingAnchor, constant: -10),
        ])
    }
}
