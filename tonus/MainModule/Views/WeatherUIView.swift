//
//  WeatherUIView.swift
//  tonus
//
//  Created by Витя Рябко on 21/02/23.
//

import UIKit

class WeatherUIView: UIView {
    
    // MARK: - UI Components
    
    private let weatherTitleLabel = UILabel(text: "Солнечно", textColor: .specialBlack, font: .robotoBold16())
    private let weatherSubtitleLabel = UILabel(text: "Хорошая погода, чтобы позаниматься на улице", textColor: .specialLightBrown, font: .robotoMedium14())
    private let weatherStatusIconWeather = UIImageView(nameImage: "sunny")

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setupUI
    
    private func setupUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.addShadowOnView()
        weatherSubtitleLabel.numberOfLines = 2
        
        self.addSubview(weatherTitleLabel)
        self.addSubview(weatherSubtitleLabel)
        self.addSubview(weatherStatusIconWeather)
        
        weatherTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherSubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherStatusIconWeather.translatesAutoresizingMaskIntoConstraints = false
        
    }
}

// MARK: - Extensions

extension WeatherUIView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            weatherTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            weatherTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            weatherTitleLabel.trailingAnchor.constraint(equalTo: weatherStatusIconWeather.leadingAnchor, constant: 10),
            
            weatherSubtitleLabel.topAnchor.constraint(equalTo: weatherTitleLabel.bottomAnchor, constant: 5),
            weatherSubtitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            weatherSubtitleLabel.trailingAnchor.constraint(equalTo: weatherStatusIconWeather.leadingAnchor, constant: -20),
            
            weatherStatusIconWeather.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            weatherStatusIconWeather.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            weatherStatusIconWeather.widthAnchor.constraint(equalToConstant: 62),
            weatherStatusIconWeather.heightAnchor.constraint(equalToConstant: 62),
        ])
    }
}
