//
//  SelectImageCollectionView.swift
//  tonus
//
//  Created by Витя Рябко on 08/03/23.
//

import UIKit

class SelectImageCollectionView : UICollectionView {
    
    private let imageNames = ["default", "biceps", "pushup", "pullup", "squats", "triceps"]
    private var isSelectedNameImage: String = ""
    private let layoutCV = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: layoutCV)
        register(CollectionViewCustomCell.self, forCellWithReuseIdentifier: CollectionViewCustomCell.identifier)
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func config(){
        layoutCV.minimumLineSpacing         = 1
        layoutCV.scrollDirection            = .horizontal
        self.backgroundColor                = #colorLiteral(red: 0.9062973857, green: 0.8815137148, blue: 0.8126628995, alpha: 1)
        self.layer.cornerRadius             = 20
        self.bounces                        = false
        self.showsHorizontalScrollIndicator = false
        self.delegate                       = self
        self.dataSource                     = self
    }
    
    public func getNameImage() -> UIImage{
        return UIImage(named: isSelectedNameImage) ?? UIImage(named: "default")!
    }
}

extension SelectImageCollectionView : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        isSelectedNameImage = imageNames[indexPath.item]
    }
}
extension SelectImageCollectionView : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCustomCell.identifier, for: indexPath) as? CollectionViewCustomCell else {
            fatalError(" The cell could not to dequque CollectionViewCustomCell in SelectImageCollectionView")
        }
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])
        if imageNames[indexPath.item] == "default" {
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .right)
        }
        
        
        return cell
    }
}
extension SelectImageCollectionView : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 110, height: 77)
    }
}
