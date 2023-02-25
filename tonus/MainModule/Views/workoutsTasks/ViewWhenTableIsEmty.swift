//
//  ViewWhenTableIsEmty.swift
//  tonus
//
//  Created by Витя Рябко on 24/02/23.
//

import UIKit

class ViewWhenTableIsEmty: UIView {

    let imagePeople: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "People")
        image.contentMode = .scaleAspectFit
//        image.backgroundColor = .orange
        return image
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.textColor = .specialGray
        label.textAlignment = .left
        label.font = .robotoMedium36()
        label.text = "NO TRAINING"
//        label.backgroundColor = .lightGray
        return label
    }()
    
    private let subTitle: UILabel = {
        let label = UILabel()
        label.textColor = .specialGray
        label.textAlignment = .right
        label.font = .robotoMedium18()
        label.text = "press the plus button"
//        label.backgroundColor = .cyan
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
//        self.backgroundColor = .white
        
            self.addSubview(imagePeople)
            self.addSubview(title)
            self.addSubview(subTitle)
        
            imagePeople.translatesAutoresizingMaskIntoConstraints = false
            title.translatesAutoresizingMaskIntoConstraints = false
            subTitle.translatesAutoresizingMaskIntoConstraints = false
        
            setConstraints()
    }
}

extension ViewWhenTableIsEmty {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imagePeople.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
            imagePeople.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imagePeople.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6),
            imagePeople.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5),
            
            title.topAnchor.constraint(equalTo: self.imagePeople.bottomAnchor, constant: 13),
            title.leadingAnchor.constraint(equalTo: imagePeople.leadingAnchor, constant: -25),
//            title.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            
            subTitle.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 0),
            subTitle.trailingAnchor.constraint(equalTo: imagePeople.trailingAnchor, constant: 25),
//            subTitle.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            
        ])
    }
}
