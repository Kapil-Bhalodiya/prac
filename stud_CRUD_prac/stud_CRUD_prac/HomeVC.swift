//
//  HomeVC.swift
//  stud_CRUD_prac
//
//  Created by DCS on 25/02/22.
//  Copyright © 2022 DCS. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    var noteArr : [SNotes]?
    let NoteView = UITableView()
    private let lbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "Welcome, \(UserDefaults.standard.string(forKey: "session") ?? " ")"
        lbl.textColor = .orange
        return lbl
    }()
    private let add : UIButton={
        let btn = UIButton()
        btn.setTitle("ADD", for: .normal)
        btn.addTarget(self, action: #selector(clickAdd), for: .touchUpInside)
        btn.backgroundColor = .orange
        return btn
    }()
    
    @objc func clickAdd()
    {
        let vc = Notes()
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.isNavigationBarHidden = true
        noteArr = CoreDataHandler.shared.fetchNote()
        NoteView.reloadData()
        
    }
    override func viewDidLoad() {
        view.backgroundColor = .white
        view.addSubview(add)
        view.addSubview(NoteView)
        setup()
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        add.frame = CGRect(x: 60, y: 10, width: view.width-100, height: 40)
        NoteView.frame = CGRect(x: 60, y: add.bottom + 50, width: view.width-100, height: 40)
    }

}
extension HomeVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteArr!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celldata")
        cell?.textLabel?.text = noteArr![indexPath.row].title
        return cell!
    }

    
    func setup()
    {
        NoteView.delegate = self
        NoteView.dataSource = self
        NoteView.register(UITableViewCell.self, forCellReuseIdentifier: "celldata")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = Notes()
        vc.noteget = noteArr![indexPath.row]
        vc.login.setTitle("update", for: .normal)
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        CoreDataHandler.shared.delNote(e: noteArr![indexPath.row])
        noteArr?.remove(at: indexPath.row)
        NoteView.reloadData()
    }
}
