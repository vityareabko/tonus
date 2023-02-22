//
//  CalendarUIView.swift
//  tonus
//
//  Created by Витя Рябко on 20/02/23.
//

import UIKit

class CalendarUIView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupUI()
//        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        self.backgroundColor = .specialLightGreen
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
        
//        self.addSubview(<#T##UIView#>)
//        <#T##UIView#>.translatesAutoresizingMaskIntoConstraints = false
//
//
//        NSLayoutConstraint.activate([
//            <#T##UIView#>.topAnchor.constraint(equalTo: self.view.topAnchor),
//            <#T##UIView#>.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//            <#T##UIView#>.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            <#T##UIView#>.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//
//            <#T##UIView#>.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            <#T##UIView#>.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//            <#T##UIView#>.widthAnchor.constraint(equalToConstant: <#T##CGFloat#>),
//            <#T##UIView#>.heightAnchor.constraint(equalToConstant: <#T##CGFloat#>),
//
//        ])
    }
    
}

//extension CalendarUIView {
//
//    private func setConstraints() {
//        NSLayoutConstraint.activate([
//            <#T##UIView#>.topAnchor.constraint(equalTo: self.view.topAnchor),
//            <#T##UIView#>.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//            <#T##UIView#>.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            <#T##UIView#>.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//
//            <#T##UIView#>.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            <#T##UIView#>.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//            <#T##UIView#>.widthAnchor.constraint(equalToConstant: <#T##CGFloat#>),
//            <#T##UIView#>.heightAnchor.constraint(equalToConstant: <#T##CGFloat#>),
//        ])
//    }
//}
