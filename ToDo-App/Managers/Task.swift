//
//  Task.swift
//  ToDoList
//
//  Created by Mateusz Rybczyński on 17/10/2022.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String = ""
    @Persisted var note: String = ""
    @Persisted var completed = false
}
