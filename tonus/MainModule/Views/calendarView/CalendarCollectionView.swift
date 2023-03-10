//
//  CalendarCollectionView.swift
//  tonus
//
//  Created by Витя Рябко on 23/02/23.
//

import UIKit

protocol CalendarViewProtocol: AnyObject {
    func selectItem(date: Date)
}

class CalendarCollectionView: UICollectionView {

    // MARK: - Variables
    
    weak var calendarDelegate: CalendarViewProtocol?
    
    private let collectionLayout = UICollectionViewFlowLayout()
    
    // MARK: - Init
    
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
    
    // MARK: - Configuaration
    
    private func config(){
        self.backgroundColor = .specialLightGreen
        setupLayout()
    }
    
    private func setupLayout(){
        collectionLayout.minimumInteritemSpacing = 3
    }
    
}

// MARK: - Extensions

extension CalendarCollectionView : UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCollectionViewCell.identifier, for: indexPath) as? CalendarCollectionViewCell else {
            fatalError("Failed in CalendarCollectionView when we try dequeueReusebleCell")
        }

        let date = Date()
        let weekArray = date.getWeekArray()
        cell.dateForCell(numberOfDay: weekArray[1][indexPath.row], dayOfweek: weekArray[0][indexPath.row])
        
        if indexPath.row == 6 {
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .left)
        }
        
        return cell
    }
}

extension CalendarCollectionView : UICollectionViewDelegateFlowLayout{ // вид ячейки ширина висота и т д
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: self.frame.width / 8,
               height: self.frame.height)
    }
}

extension CalendarCollectionView : UICollectionViewDelegate{ // для взаимодействия с ячейкой
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dateTimeZone = Date()
        let date = dateTimeZone.offsetDay(day: 6 - indexPath.row)
        calendarDelegate?.selectItem(date: date)
    }
    
}
