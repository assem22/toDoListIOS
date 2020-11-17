//
//  Models.swift
//  ToDoList
//
//  Created by Assem Mukhamadi on 11/10/20.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var label = ""
    @objc dynamic var status = false
}
