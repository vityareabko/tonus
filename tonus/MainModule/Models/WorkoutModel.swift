//
//  WorkoutModel.swift
//  tonus
//
//  Created by Витя Рябко on 06/03/23.
//

import Foundation
import RealmSwift

class WorkoutModel: Object {
    @Persisted(primaryKey: true) var _id: RealmSwift.ObjectId
    @Persisted var workoutDate : Date
    @Persisted var workoutNumberOfDay : Int = 0
    @Persisted var titleWorkout : String = "Unknown"
    @Persisted var workoutRepeatEveryWeek : Bool = true
    @Persisted var workoutSets : Int = 0
    @Persisted var workoutReps : Int = 0
    @Persisted var workoutTimer : Int = 0 // in seconds
    @Persisted var workoutImageData : Data?
    @Persisted var workoutImageName : String = ""
    @Persisted var workoutStatus : Bool = false
}
