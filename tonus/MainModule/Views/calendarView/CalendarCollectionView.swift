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
        
        config()
        setupLayout()
        
        self.dataSource = self
        self.delegate = self
        
        self.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: CalendarCollectionViewCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func config(){
        self.backgroundColor = .red
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupLayout(){
        collectionLayout.minimumInteritemSpacing = 1
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
        print("did tap item: ", indexPath.item)
    }
    
}
