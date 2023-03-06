//
//  RealmManager.swift
//  tonus
//
//  Created by Витя Рябко on 06/03/23.
//

import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    private init() {}
    
    let realm = try! Realm()
    
    func saveWorkoutModel(model: WorkoutModel) {
        try! realm.write {
            realm.add(model)
        }
    }
}

