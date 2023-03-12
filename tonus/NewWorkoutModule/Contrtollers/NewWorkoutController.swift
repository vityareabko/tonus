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
    
    public var closureReloadData: (() -> Void)?
    
    //--------------------- for update Cell in main VC
    
    /* эти даные мы используем только при update Cell
     когда мы образаемся к контролеру для update
     то мы там же переопределчем эти даные по-этому они пубдичные
    */
     var workoutTitle : String = ""
    var nameImageSelected : String = ""
    var workoutdate: Date = Date()
    var workoutRepeat: Bool = false
    var sets: Int = 0
    var reps: Int = 0
    var timer: Int = 0
    var isUpdate: Bool = false
    var indexPath: IndexPath? = nil
    
    
    // здесь мы подставляем нашы даные из конкретной ячейки
    // помним что - нашы даные переопределены в mainVC для понимания
    // мы создали set функция где меняем значения из ячейки для update
    public func updateForEditData(){
        workoutInputNameView.nameTextField.text = workoutTitle
        wrapViewForCollectionView.setSelectedImage(selectedImage: nameImageSelected)
        dateAndRepeatView.setContainDateAndRepeatView(date: workoutdate, isRepeat: workoutRepeat)
        repsOrTimerView.setSliderValues(sets: sets, reps: reps, timer: timer)
    }
      
    //---------------------
    
    
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
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(touchScreen))
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(touchScreen))
        self.view.addGestureRecognizer(recognizer)
        self.view.addGestureRecognizer(swipeRecognizer)
        recognizer.cancelsTouchesInView = false
        swipeRecognizer.cancelsTouchesInView = false
        setupUI()
    }
    
    convenience init(title: String){
        self.init()
        self.titleAndCloseButtonUIView.titleLabel.text = title
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
    
    private func setModel(){
        let getNumberOfDayofWeek = dateAndRepeatView.getContainDateAndReatView().date.getNumberOfDayOfWeek()
        workoutModel.titleWorkout = workoutInputNameView.getContainTextField()
        workoutModel.workoutDate = dateAndRepeatView.getContainDateAndReatView().date
        workoutModel.workoutRepeatEveryWeek = dateAndRepeatView.getContainDateAndReatView().isRepeat
        workoutModel.workoutNumberOfDay = getNumberOfDayofWeek
        workoutModel.workoutImageData = wrapViewForCollectionView.getSelectedImage().image.pngData()
        workoutModel.workoutImageName = wrapViewForCollectionView.getSelectedImage().nameImage
        workoutModel.workoutSets = repsOrTimerView.sets
        workoutModel.workoutReps = repsOrTimerView.reps
        workoutModel.workoutTimer = repsOrTimerView.timer
    }
    
    private func updateModel(){
        let updateObjectDB = RealmManager.shared.realm.objects(WorkoutModel.self)
        try! RealmManager.shared.realm.write {
            updateObjectDB[indexPath!.row].titleWorkout = workoutInputNameView.getContainTextField()
            updateObjectDB[indexPath!.row].workoutDate = dateAndRepeatView.getContainDateAndReatView().date
            updateObjectDB[indexPath!.row].workoutRepeatEveryWeek = dateAndRepeatView.getContainDateAndReatView().isRepeat
            updateObjectDB[indexPath!.row].workoutNumberOfDay = dateAndRepeatView.getContainDateAndReatView().date.getNumberOfDayOfWeek()
            updateObjectDB[indexPath!.row].workoutImageData = wrapViewForCollectionView.getSelectedImage().image.pngData()
            updateObjectDB[indexPath!.row].workoutImageName = wrapViewForCollectionView.getSelectedImage().nameImage
            updateObjectDB[indexPath!.row].workoutSets = repsOrTimerView.sets
            updateObjectDB[indexPath!.row].workoutReps = repsOrTimerView.reps
            updateObjectDB[indexPath!.row].workoutTimer = repsOrTimerView.timer
        }
    }
    
    private func validModel() -> Bool{
        let text = workoutInputNameView.getContainTextField()
        let trimmedText = text.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmedText.count != 0 &&
            repsOrTimerView.sets != 0 &&
            (repsOrTimerView.reps != 0 || repsOrTimerView.timer != 0){
            return true
        }
        
        return false
    }
    
    private func shakeViewsWhichNeedToComplited(){
        if workoutInputNameView.getContainTextField().count == 0 {
            workoutInputNameView.shake(horizontal: 3)
        }
        if repsOrTimerView.sets == 0 {
            repsOrTimerView.shakeSetsSlider()
        }
        if (repsOrTimerView.reps == 0 && repsOrTimerView.timer == 0) {
            repsOrTimerView.shakeRepsSlider()
            repsOrTimerView.shakeTimerSlider()
        }
    }
    
    @objc private func touchScreen(){
        self.view.endEditing(true)
    }
    
    @objc private func didTappedCloseButton(){
        dismiss(animated: true)
    }
    
    @objc private func didTappedSaveButton(){
        
        if !isUpdate{
            setModel()
            validModel() ? dismiss(animated: true) : shakeViewsWhichNeedToComplited()
            validModel() ? RealmManager.shared.saveWorkoutModel(model: workoutModel) : print("not valid")
            closureReloadData?()
        } else {
            updateModel()
            validModel() ? dismiss(animated: true) : shakeViewsWhichNeedToComplited()
            closureReloadData?()
            isUpdate = !isUpdate
        }
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


