//
//  ViewController.swift
//  Revisao
//
//  Created by ihan carlos on 05/04/23.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    var auth:Auth?
    var loginScreen:LoginScreen?
    var alert:Alert?
    
    //criacao de uma view
    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.delegate(delegate: self)
        loginScreen?.configtextfieldDelegate(delegate: self)
        alert = Alert(controller: self)
        auth = Auth.auth()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        loginScreen?.validTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension LoginViewController: LoginScreenProtocol{
    func actionLoginButton() {
        
//        guard let login = loginScreen else {return}
//
//        auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { (usuario, error) in
//            if error != nil {
//                self.alert?.getAlert(title: "Atenção", mensagem: "Credenciais incorretas, verifique e tente novamente!")
//            }else{
//                if usuario == nil {
//                    self.alert?.getAlert(title: "Desculpe", mensagem: "Tivemos um problema interno ou estamos em manutenção, tente novamente mais tarde")
//                }else{
//                    let vc:HomeViewController = HomeViewController()
//                    self.navigationController?.pushViewController(vc, animated: true)
//                }
//            }
//        })
        
        let vc:HomeViewController = HomeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func actionRegisterButton() {
        let vc:RegisterViewController = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
