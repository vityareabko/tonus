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
                                           font: .robotoMedium14())
    
    private let bagroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialBrown
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let setsBlockView = SliderView(name: "Sets", minValue: 0, maxValue: 10, sliderType: .sets)
    private let repsBlockView = SliderView(name: "Reps", minValue: 0, maxValue: 30, sliderType: .reps)
    private let timerBlockView = SliderView(name: "Timer", minValue: 0, maxValue: 600, sliderType: .timer)
    
    private let choseRepeatOrTimerLabel = UILabel(text: "Choose repeat or timer",
                                                  textColor: .specialLightBrown,
                                                  font: .robotoMedium14())

    private var stackViewBlocks = UIStackView()
    public var (sets, reps, timer) = (0,0,0)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupUI()
        setsBlockView.delegate = self
        repsBlockView.delegate = self
        timerBlockView.delegate = self
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
    
    public func shakeSetsSlider() {
        setsBlockView.shake(horizontal: 2)
    }
    
    public func shakeRepsSlider() {
        repsBlockView.shake(horizontal: 2)
    }
    
    public func shakeTimerSlider() {
        timerBlockView.shake(horizontal: 2)
    }
}

extension RepsOrTimerView : SliderViewProtocol {
    func changeValue(type: SlideType, value: Int) {
        switch type {
        case .sets:
            sets = value
        case .reps:
            reps = value
            repsBlockView.isActive = true
            timerBlockView.isActive = false
            timer = 0 // обнуляем перем. из картеж который буде передан в БД
        case .timer:
            timer = value
            timerBlockView.isActive = true
            repsBlockView.isActive = false
            reps = 0 // обнуляем перем. из картеж который буде передан в БД
        }
        if timer == 0 && reps == 0 {
            timerBlockView.isActive = true
            repsBlockView.isActive = true
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

