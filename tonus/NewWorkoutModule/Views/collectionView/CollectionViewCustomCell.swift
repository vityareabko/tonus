//
//  CollectionViewCustomCell.swift
//  tonus
//
//  Created by Витя Рябко on 08/03/23.
//

import UIKit
 
class CollectionViewCustomCell : UICollectionViewCell {
    
    static let identifier = "CustomCell"


    let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "testWorkout")?.withRenderingMode(.alwaysOriginal)
        image.tintColor = .specialDarkGreen
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .clear
        return image
    }()
    
    private let backViewImgage : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9294117647, blue: 0.8862745098, alpha: 1)
        view.layer.cornerRadius = 20
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                backViewImgage.backgroundColor = UIColor.specialLightGreen
                imageView.tintColor = .white
            }else {
                backViewImgage.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9294117647, blue: 0.8862745098, alpha: 1)
                imageView.tintColor = .specialDarkGreen
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .clear
        
        self.addSubview(backViewImgage)
        backViewImgage.addSubview(imageView)
        backViewImgage.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        setConstraints()
    }
    
}

extension CollectionViewCustomCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backViewImgage.topAnchor.constraint(equalTo: self.topAnchor),
            backViewImgage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 7.5),
            backViewImgage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -7.5),
            backViewImgage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: backViewImgage.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: backViewImgage.centerYAnchor),
            // TODO: - height width for interactive
            
        ])
    }
}
