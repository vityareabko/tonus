//
//  CalendarCollectionView.swift
//  tonus
//
//  Created by Витя Рябко on 23/02/23.
//

import UIKit

class CalendarCollectionView: UICollectionView {

    private let collectionLayout = UICollectionViewFlowLayout()
    
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: collectionLayout)
        self.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: CalendarCollectionViewCell.identifier)
        
        config()
        
        
        self.dataSource = self
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func config(){
        self.backgroundColor = .specialLightGreen
        setupLayout()
    }
    
    private func setupLayout(){
        collectionLayout.minimumInteritemSpacing = 3
    }
    
}

extension CalendarCollectionView : UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCollectionViewCell.identifier, for: indexPath) as? CalendarCollectionViewCell else {
            fatalError("Failed in CalendarCollectionView when we try dequeueReusebleCell")
        }
        
        return cell
    }
}

extension CalendarCollectionView : UICollectionViewDelegateFlowLayout{ // вид ячейки ширина висота и т д
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: self.frame.width / 7.2,
               height: self.frame.height)
    }
}

extension CalendarCollectionView : UICollectionViewDelegate{ // для взаимодействия с ячейкой
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("did tap item: ", indexPath)
    }
    
}
