//
//  ProfileViewControler.swift
//  tonus
//
//  Created by Витя Рябко on 10/03/23.


import UIKit

class ProfileViewControler: UIViewController {
    
    // MARK: - Variables
    
    
    // MARK: - UI Components
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .specialMainBackground
        
//        self.view.addSubview(<#T##UIView#>)
//        <#T##UIView#>.translatesAutoresizingMaskIntoConstraints = false
        setConstraints()
    }
    
    
    // MARK: - Selectors
    
    
    
}

extension ProfileViewControler {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            //            <#T##UIView#>.topAnchor.constraint(equalTo: self.view.topAnchor),
            //            <#T##UIView#>.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            //            <#T##UIView#>.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            //            <#T##UIView#>.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            //
            //            <#T##UIView#>.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            //            <#T##UIView#>.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            //            <#T##UIView#>.widthAnchor.constraint(equalToConstant: <#T##CGFloat#>),
            //            <#T##UIView#>.heightAnchor.constraint(equalToConstant: <#T##CGFloat#>),
        ])
    }
}
