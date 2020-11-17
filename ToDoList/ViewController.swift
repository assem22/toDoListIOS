//
//  ViewController.swift
//  ToDoList
//
//  Created by Assem Mukhamadi on 11/10/20.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let realm = try! Realm()// [1]
    var todoList: Results<Item> { // [2]
        get {
            return realm.objects(Item.self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        reload()
    }

    override func viewWillAppear(_ animated: Bool) {
        reload()
    }
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    func reload() {
        tableView.reloadData()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        let item = todoList[indexPath.row]
        cell.labelTextField.text = item.label
        cell.cellDelegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddViewController") as? AddViewController
        vc?.incomingData = todoList[indexPath.row]
        navigationController?.pushViewController(vc!, animated: true)
    }
}


extension ViewController: CustomCellDelegate {
    func customcell(cell: MyTableViewCell, didTappedThe button: UIButton?) {
        guard let indexPath = tableView.indexPath(for: cell) else  { return }
        let item = todoList[indexPath.row]
        if item.status == false {
            try! realm.write {
                cell.buttonField.setTitle("Do it", for: .normal)
                item.status = true
            }
        }else{
            try! realm.write {
                item.status = false
                cell.buttonField.setTitle("Done", for: .normal)
            }
        }
    }
}
