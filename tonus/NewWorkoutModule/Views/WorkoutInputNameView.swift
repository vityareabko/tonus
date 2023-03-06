//
//  WorkoutInputNameView.swift
//  tonus
//
//  Created by Витя Рябко on 02/03/23.
//

import UIKit

class WorkoutInputNameView: UIView {
    
    private let nameLabel = UILabel(text: "Name", textColor: .specialLightBrown, font: .robotoMedium14())

    private let nameTextField: UITextField = {
        let tf = UITextField()
        tf.textColor = .specialGray
        tf.textAlignment = .left
        tf.font = .robotoMedium18()
        tf.layer.cornerRadius = 10
        tf.backgroundColor = .specialBrown
        tf.clearButtonMode = .always // TODO: - don't work

        tf.leftViewMode = .always
//        tf.rightViewMode = .always
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 17, height: 0))
//        tf.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 17, height: 0))
        tf.attributedPlaceholder = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.secondaryLabel])
        tf.autocapitalizationType = .sentences
        tf.autocorrectionType = .default
        tf.returnKeyType = .done
        
        return tf
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .clear
        self.addSubview(nameLabel)
        self.addSubview(nameTextField)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        setConstraints()
    }
    
    public func getContainTextField() -> String {
        guard let containTF = nameTextField.text else { return "" }
        return containTF
    }
}

extension WorkoutInputNameView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 27),
            nameLabel.widthAnchor.constraint(equalToConstant: 30),
            nameLabel.heightAnchor.constraint(equalToConstant: 16),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            nameTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            nameTextField.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
}
