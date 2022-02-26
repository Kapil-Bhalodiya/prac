//
//  Login.swift
//  stud_CRUD_prac
//
//  Created by DCS on 25/02/22.
//  Copyright © 2022 DCS. All rights reserved.
//

import UIKit

class Login: UIViewController {
    
    private let header : UILabel={
       let head = UILabel()
        head.text = "LOGIN"
        head.textColor = .orange
        head.font = UIFont.boldSystemFont(ofSize: 20)
        return head
    }()
    
    private let email : UITextField={
       let email = UITextField()
        email.placeholder = "Enter Email"
        email.layer.borderWidth = 2
        email.layer.cornerRadius = 10
        return email
    }()
    
    private let pass : UITextField={
        let email = UITextField()
        email.isSecureTextEntry = true
        email.placeholder = "***********"
        email.layer.borderWidth = 2
        email.layer.cornerRadius = 10
        return email
    }()
    
    let login : UIButton={
       let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.addTarget(self, action: #selector(clicklogin), for: .touchUpInside)
        btn.backgroundColor = .orange
        return btn
    }()
    
    private let register : UIButton={
        let btn = UIButton()
        btn.setTitle("New User ?", for: .normal)
        btn.addTarget(self, action: #selector(clickregister), for: .touchUpInside)
        btn.setTitleColor(.blue, for: .normal)
        return btn
    }()
    
    @objc func clicklogin(){
        let u = CoreDataHandler.shared.auth(email: email.text!, pass: pass.text!)
        if u.username != ""
        {
            UserDefaults.standard.set(email.text!, forKey: "session")
            let vc = HomeVC()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    @objc func clickregister(){
        let vc = Register()
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        view.addSubview(header)
        view.addSubview(email)
        view.addSubview(pass)
        view.addSubview(login)
        view.addSubview(register)
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        header.frame = CGRect(x: 50, y: 100, width: view.width - 100, height: 30)
        email.frame = CGRect(x: 20, y: header.bottom + 20, width: view.width-40, height: 40)
         pass.frame = CGRect(x: 20, y: email.bottom + 20, width: view.width-40, height: 40)
         login.frame = CGRect(x: 20, y: pass.bottom + 20, width: view.width-40, height: 40)
        register.frame = CGRect(x: 10 , y: login.bottom + 30, width: view.width - 20, height: 20)
        super.viewDidLayoutSubviews()
    }
}
