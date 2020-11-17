//
//  AddViewController.swift
//  ToDoList
//
//  Created by Assem Mukhamadi on 11/10/20.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController {

    let realm = try! Realm()
    
    @IBOutlet weak var textField: UITextField!
        
    @IBOutlet weak var addBtn: UIBarButtonItem!
    
    var incomingData: Item? = nil
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        if let goodToDo = incomingData {
            try! realm.write{
                goodToDo.label = textField.text!
            }
        }else{
            let toDo = Item()
            toDo.label = textField.text!
            
            try! realm.write{
                realm.add(toDo)
            }
        }
        
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let goodToDo = incomingData {
            try! realm.write{
                textField.text = goodToDo.label
            }
        }
    }
}
