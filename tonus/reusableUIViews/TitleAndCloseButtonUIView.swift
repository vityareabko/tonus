//
//  TitleAndCloseButtonUIView.swift
//  tonus
//
//  Created by Витя Рябко on 02/03/23.
//

import UIKit

class TitleAndCloseButtonUIView: UIView {
    
    private let titleLabel = UILabel(text: "Error", textColor: .specialGray, font: .robotoMedium24()!)
    
    var clouser: (() -> Void)?

    private var closeButton = CircleCloseButton()
//    var closeButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
//        button.addTarget(self, action: #selector(didTappedCloseButton), for: .touchUpInside)
//        return button
//    }()

    init(title: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTappedCloseButton() {
        clouser!()
    }
    
    private func setupUI() {
        self.backgroundColor = .clear
        
        closeButton.addTarget(self, action: #selector(didTappedCloseButton), for: .touchUpInside)
        
        self.addSubview(titleLabel)
        self.addSubview(closeButton)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false

        setConstraints()
    }
}
extension TitleAndCloseButtonUIView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            closeButton.widthAnchor.constraint(equalToConstant: 33),
            closeButton.heightAnchor.constraint(equalToConstant: 33),
        ])
    }
}

