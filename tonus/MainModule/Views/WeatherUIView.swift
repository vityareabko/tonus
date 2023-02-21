//
//  WeatherUIView.swift
//  tonus
//
//  Created by Витя Рябко on 21/02/23.
//

import UIKit

class WeatherUIView: UIView {

    private let titleWeatherLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.3176470588, green: 0.3176470588, blue: 0.3137254902, alpha: 1)
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.text = "Sunny"
        return label
    }()
    
    private let wishTaskLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.7607843137, green: 0.7607843137, blue: 0.7607843137, alpha: 1)
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "Хорошая погода, чтобы позаниматься на улице"
        label.numberOfLines = 2
        return label
    }()
    
    let kindWeatherImage: UIImageView = {
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
        
        self.addSubview(titleWeatherLabel)
        self.addSubview(wishTaskLabel)
        self.addSubview(kindWeatherImage)
        
        titleWeatherLabel.translatesAutoresizingMaskIntoConstraints = false
        wishTaskLabel.translatesAutoresizingMaskIntoConstraints = false
        kindWeatherImage.translatesAutoresizingMaskIntoConstraints = false
        
    }
}

extension WeatherUIView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleWeatherLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titleWeatherLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            titleWeatherLabel.trailingAnchor.constraint(equalTo: kindWeatherImage.leadingAnchor, constant: 10),
            
            wishTaskLabel.topAnchor.constraint(equalTo: titleWeatherLabel.bottomAnchor, constant: 5),
            wishTaskLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            wishTaskLabel.trailingAnchor.constraint(equalTo: kindWeatherImage.leadingAnchor, constant: -40),
            
            kindWeatherImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            kindWeatherImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            kindWeatherImage.widthAnchor.constraint(equalToConstant: 62),
            kindWeatherImage.heightAnchor.constraint(equalToConstant: 62),
            
            
        ])
    }
}
