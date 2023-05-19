//
//  RegisterViewController.swift
//  Revisao
//
//  Created by ihan carlos on 05/04/23.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    var register:RegisterScreen?
    
    var auth:Auth?
    
    override func loadView() {
        register = RegisterScreen()
        view = register
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register?.delegate(delegate: self)
        register?.configtextfieldDelegate(delegate: self)
        auth = Auth.auth()
    }
}

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        register?.validTextFiels()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension RegisterViewController: RegisterScreenProtocol {
    func actionBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
        
        guard let register = register else {return}
        
        auth?.createUser(withEmail: register.getEmail(), password: register.getPassword(), completion: { (result, error) in
            
            if error != nil {
                print("Error ao cadastrar")
            }else {
                print("Sucesso ao cadastrar")
            }
            
        })
    }
    
    
}
