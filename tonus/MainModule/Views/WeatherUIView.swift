//
//  WeatherUIView.swift
//  tonus
//
//  Created by Витя Рябко on 21/02/23.
//

import UIKit

class WeatherUIView: UIView {

    private let weatherTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .specialBlack
        label.font = .robotoBold16()
        label.text = "Солнечно"
        return label
    }()
    
    private let weatherSubtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .specialLightBrown
        label.font = .robotoMedium14()
        label.text = "Хорошая погода, чтобы позаниматься на улице"
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        return label
    }()
    
    let weatherStatusIconWeather: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "sunny")
//        image.contentMode = .scaleAspectFit
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.addShadowOnView()
        
        self.addSubview(weatherTitleLabel)
        self.addSubview(weatherSubtitleLabel)
        self.addSubview(weatherStatusIconWeather)
        
        weatherTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherSubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherStatusIconWeather.translatesAutoresizingMaskIntoConstraints = false
        
    }
}

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
