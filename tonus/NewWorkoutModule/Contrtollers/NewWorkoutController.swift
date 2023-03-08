//
//  NewWorkoutController.swift
//  tonus
//
//  Created by Витя Рябко on 02/03/23.
//

import UIKit
 
class NewWorkoutController: UIViewController {
    
    private let titleAndCloseButtonUIView = TitleAndCloseButtonUIView(title: "NEW WORKOUT")
    
    private let saveButton = UIButton(text: "SAVE", bagroungColor: .specialLightGreen, textColor: .white)
    private let workoutInputNameView = WorkoutInputNameView()
    private let wrapViewForCollectionView = WrapViewForCollectionView()
    private let dateAndRepeatView = DateAndRepeatView()
    private let repsOrTimerView = RepsOrTimerView()
    
    private var workoutModel = WorkoutModel()
    
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.backgroundColor = .none
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        
        return scrollView
    }()
    
    private var contentSize: CGSize {
        CGSize(width: self.view.frame.width, height: 750)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(touchScreen1))
        self.view.addGestureRecognizer(recognizer)
        recognizer.cancelsTouchesInView = false
        setupUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
        
    }
    
    
    
    private func setupUI() {
        self.view.backgroundColor = .specialMainBackground
               
        titleAndCloseButtonUIView.clouser = { [weak self] in
            self?.dismiss(animated: true)
        }
        
        
        saveButton.addTarget(self, action: #selector(didTappedSaveButton), for: .touchUpInside)
        
        self.view.addSubview(titleAndCloseButtonUIView)
        self.view.addSubview(scrollView)
        scrollView.addSubview(workoutInputNameView)
        scrollView.addSubview(wrapViewForCollectionView)
        scrollView.addSubview(dateAndRepeatView)
        scrollView.addSubview(repsOrTimerView)
        scrollView.addSubview(saveButton)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        titleAndCloseButtonUIView.translatesAutoresizingMaskIntoConstraints = false
        workoutInputNameView.translatesAutoresizingMaskIntoConstraints = false
        wrapViewForCollectionView.translatesAutoresizingMaskIntoConstraints = false
        dateAndRepeatView.translatesAutoresizingMaskIntoConstraints = false
        repsOrTimerView.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        setConstraints()
    }
    
    @objc private func touchScreen1(){
        self.view.endEditing(true)
    }
    
    @objc private func didTappedCloseButton(){
        dismiss(animated: true)
    }
    
    @objc private func didTappedSaveButton(){
        setModel()
        print(workoutModel)
        RealmManager.shared.saveWorkoutModel(model: workoutModel)
        dismiss(animated: true)
    }
    
    private func setModel(){
        let getNumberOfDayofWeek = dateAndRepeatView.getContainDateAndReatView().date.getNumberOfDayOfWeek()
        
        workoutModel.titleWorkout = workoutInputNameView.getContainTextField()
        workoutModel.workoutDate = dateAndRepeatView.getContainDateAndReatView().date
        workoutModel.workoutRepeatEveryWeek = dateAndRepeatView.getContainDateAndReatView().isRepeat
        workoutModel.workoutNumberOfDay = getNumberOfDayofWeek
        workoutModel.workoutImage = wrapViewForCollectionView.getSelectedImage().pngData()
        workoutModel.workoutSets = repsOrTimerView.sets
        workoutModel.workoutReps = repsOrTimerView.reps
        workoutModel.workoutTimer = repsOrTimerView.timer
        
    }
}

extension NewWorkoutController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleAndCloseButtonUIView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleAndCloseButtonUIView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            titleAndCloseButtonUIView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            titleAndCloseButtonUIView.heightAnchor.constraint(equalToConstant: 30),
            
            scrollView.topAnchor.constraint(equalTo: titleAndCloseButtonUIView.bottomAnchor, constant: 5),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
            
            workoutInputNameView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5),
            workoutInputNameView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            workoutInputNameView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            workoutInputNameView.heightAnchor.constraint(equalToConstant: 60),
            
            wrapViewForCollectionView.topAnchor.constraint(equalTo: workoutInputNameView.bottomAnchor, constant: 15),
            wrapViewForCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            wrapViewForCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            wrapViewForCollectionView.heightAnchor.constraint(equalToConstant: 115),
            
            
            dateAndRepeatView.topAnchor.constraint(equalTo: wrapViewForCollectionView.bottomAnchor, constant: 15),
            dateAndRepeatView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            dateAndRepeatView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            dateAndRepeatView.heightAnchor.constraint(equalToConstant: 120),
            
            repsOrTimerView.topAnchor.constraint(equalTo: dateAndRepeatView.bottomAnchor, constant: 15),
            repsOrTimerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            repsOrTimerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            repsOrTimerView.heightAnchor.constraint(equalToConstant: 295),
            
            saveButton.topAnchor.constraint(equalTo: repsOrTimerView.bottomAnchor, constant: 15),
            saveButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}


