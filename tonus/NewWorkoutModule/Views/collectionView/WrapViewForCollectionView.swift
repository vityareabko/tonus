//
//  WrapViewForCollectionView.swift
//  tonus
//
//  Created by Витя Рябко on 08/03/23.
//

import UIKit

class WrapViewForCollectionView: UIView {

    private let selectImageLabel = UILabel(text: "Select Image", textColor: .specialLightBrown, font: .robotoMedium14())
    
    private let selectImageCollectionView = SelectImageCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .none
        
        
        self.addSubview(selectImageLabel)
        self.addSubview(selectImageCollectionView)
        selectImageLabel.translatesAutoresizingMaskIntoConstraints = false
        selectImageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        setConstraints()
    }
    
    public func getSelectedImage() -> UIImage {
        return selectImageCollectionView.getNameImage()
    }
}

extension WrapViewForCollectionView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            selectImageLabel.topAnchor.constraint(equalTo: self.topAnchor),
            selectImageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 7),
            selectImageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            selectImageLabel.heightAnchor.constraint(equalToConstant: 15),
            
            selectImageCollectionView.topAnchor.constraint(equalTo: selectImageLabel.bottomAnchor,constant: 3),
            selectImageCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            selectImageCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            selectImageCollectionView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}
