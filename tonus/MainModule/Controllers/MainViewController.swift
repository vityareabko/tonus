//
//  ViewController.swift
//  tonus
//
//  Created by Витя Рябко on 20/02/23.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController {
   
    // MARK: - UI Components
    private let headerView = HeaderUIView()
    private let weatherUIView = WeatherUIView()
    private let viewWhenTableIsEmty = ViewWhenTableIsEmty() // TODO: - is view whe our table is empty
    private let workOutTasksView = WorkOutTasksView()
    public var closureCalendarDelegate : (()->Void)?
    
    
    private lazy var addWorkoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialYellow
        button.tintColor = .specialDarkGreen
        button.imageEdgeInsets = .init(top: 0, left: 20, bottom: 15, right: 0)
        button.titleEdgeInsets = .init(top: 50, left: -40, bottom: 0, right: 0)
        button.titleLabel?.font = .robotoMedium12()
        button.layer.cornerRadius = 10
        button.setTitle("Add Workout", for: .normal)
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.addTarget(self, action: #selector(didTappedAddWorkoutButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLayoutSubviews() {
        headerView.userImage.layer.cornerRadius = headerView.userImage.frame.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: - получаем дату из календаря по тапу и надо обновить даные из бд в таблице
        headerView.setDelegateCalendarView(self) // mainViewController я стучусь к делегату через функцию в HeaderUIView
        
        
        setupUI()
        setConstraints()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        
        view.backgroundColor = .specialMainBackground
        
        addWorkoutButton.addShadowOnView()
        
        self.view.addSubview(headerView)
        self.view.addSubview(addWorkoutButton)
        self.view.addSubview(weatherUIView)
        self.view.addSubview(viewWhenTableIsEmty)
        self.view.addSubview(workOutTasksView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        addWorkoutButton.translatesAutoresizingMaskIntoConstraints = false
        weatherUIView.translatesAutoresizingMaskIntoConstraints = false
        viewWhenTableIsEmty.translatesAutoresizingMaskIntoConstraints = false
        workOutTasksView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Selectors
    
    @objc private func didTappedAddWorkoutButton(){
        let vc = NewWorkoutController()
        vc.modalPresentationStyle = .fullScreen
        vc.closureReloadData = { [weak self] in
            self?.workOutTasksView.reloadDataTable()
        }
        
        present(vc, animated: true)
    }
    
}

extension MainViewController : CalendarViewProtocol{
    func selectItem(date: Date) {
        print(date)
    }
}

extension MainViewController {
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 120),
            
            addWorkoutButton.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 15),
            addWorkoutButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            addWorkoutButton.widthAnchor.constraint(equalToConstant: 80),
            addWorkoutButton.heightAnchor.constraint(equalToConstant: 80),
            
            weatherUIView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 15),
            weatherUIView.leadingAnchor.constraint(equalTo: addWorkoutButton.trailingAnchor, constant: 15),
            weatherUIView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
            weatherUIView.heightAnchor.constraint(equalToConstant: 80),
            
            viewWhenTableIsEmty.topAnchor.constraint(equalTo: weatherUIView.bottomAnchor, constant: 15),
            viewWhenTableIsEmty.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            viewWhenTableIsEmty.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            viewWhenTableIsEmty.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50),
            
            workOutTasksView.topAnchor.constraint(equalTo: weatherUIView.bottomAnchor, constant: 15),
            workOutTasksView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            workOutTasksView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            workOutTasksView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
            
        ])
    }
}

