//
//  LoginScreen.swift
//  Revisao
//
//  Created by ihan carlos on 05/04/23.
//

import UIKit

protocol LoginScreenProtocol:AnyObject{
    func actionLoginButton()
    func actionRegisterButton()
}

class LoginScreen: UIView {
    
   private weak var delegate:LoginScreenProtocol?
    
    func delegate(delegate:LoginScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var cardContainerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var backgroundImage: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "Binary")
        return img
    }()
    
    lazy var titleLabel: UILabel = {
       let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .white
        l.text = "Binary"
        l.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        return l
    }()
    
    lazy var logoImage: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "logoBinarySemFundo")
        return img
    }()
    
    lazy var descriptionLabel: UILabel = {
        let d = UILabel()
        d.translatesAutoresizingMaskIntoConstraints = false
        d.text = "your future in the palm of your hand"
        d.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        d.textColor = .white
        return d
    }()
    
    lazy var emailTextField:UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.autocorrectionType = .no
        txt.backgroundColor = .white
        txt.borderStyle = .roundedRect
//        txt.keyboardType = .emailAddress
        txt.keyboardType = .asciiCapable
        txt.placeholder = "Digite seu email"
        txt.textColor = .darkGray
        txt.layer.shadowOpacity = 1
        txt.layer.shadowOffset = CGSize(width: 0, height: -2)
        txt.layer.shadowRadius = 10
        return txt
    }()
    
    lazy var passwordTextField:UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.autocorrectionType = .no
        txt.backgroundColor = .white
        txt.borderStyle = .roundedRect
//        txt.keyboardType = .default
        txt.keyboardType = .asciiCapable
        txt.placeholder = "Digite sua senha"
        txt.isSecureTextEntry = true
        txt.textColor = .darkGray
        txt.layer.shadowOpacity = 1
        txt.layer.shadowOffset = CGSize(width: 0, height: -2)
        txt.layer.shadowRadius = 10
        return txt
    }()
    
    lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Logar", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        btn.setTitleColor(.white, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 7.5
        btn.backgroundColor = .darkGray
        btn.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        return btn
    }()
    
    lazy var registerButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Criar conta", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        btn.setTitleColor(.white, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 7.5
        btn.backgroundColor = .darkGray
        btn.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return btn
    }()
    
    lazy var appleImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "apple.logo")
        img.tintColor = .black
        return img
    }()
    
    lazy var appleLoginButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Login com Apple", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        btn.setTitleColor(.white, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 7.5
        btn.backgroundColor = .darkGray
        btn.tintColor = UIColor(named: "DarkGreen")
        btn.layer.shadowOpacity = 1
        btn.layer.shadowOffset = CGSize(width: 0, height: -2)
        btn.layer.shadowRadius = 20
        return btn
    }()
    
    lazy var googleImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "google")
        img.backgroundColor = .darkGray
        img.clipsToBounds = true
        img.layer.cornerRadius = 7.5
        return img
    }()
    
    lazy var googleLoginButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Login com Google", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        btn.setTitleColor(.white, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 7.5
        btn.backgroundColor = .darkGray
        btn.tintColor = UIColor(named: "DarkGreen")
        btn.layer.shadowOpacity = 1
        btn.layer.shadowOffset = CGSize(width: 0, height: -2)
        btn.layer.shadowRadius = 20
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        setUpContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements(){
        addSubview(cardContainerView)
        cardContainerView.addSubview(backgroundImage)
        cardContainerView.addSubview(titleLabel)
        cardContainerView.addSubview(descriptionLabel)
        cardContainerView.addSubview(emailTextField)
        cardContainerView.addSubview(passwordTextField)
        cardContainerView.addSubview(logoImage)
        cardContainerView.addSubview(loginButton)
        cardContainerView.addSubview(registerButton)
//        cardContainerView.addSubview(appleLoginButton)
//        appleLoginButton.addSubview(appleImage)
//        cardContainerView.addSubview(googleLoginButton)
//        googleLoginButton.addSubview(googleImage)
    }
    
    public func configtextfieldDelegate(delegate: UITextFieldDelegate) {
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc private func tappedLoginButton() {
        self.delegate?.actionLoginButton()
    }
    
    @objc private func tappedRegisterButton() {
        self.delegate?.actionRegisterButton()
    }
    
    public func validTextFields() {
        let email:String = self.emailTextField.text ?? ""
        let password:String = self.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty  {
            self.configButtonEnable(enable: true)
        }else{
            self.configButtonEnable(enable: false)
        }
    }
    
    private func configButtonEnable(enable:Bool) {
        if enable{
            self.loginButton.setTitleColor(.white, for: .normal)
            self.loginButton.isEnabled = true
        }else{
            self.loginButton.setTitleColor(UIColor(named: "DarkRed"), for: .normal)
            self.loginButton.isEnabled = false
        }
    }
    
    public func getEmail()-> String {
        return emailTextField.text ?? ""
    }
    
    public func getPassword()-> String {
        return passwordTextField.text ?? ""
    }
    
    private func setUpContraints() {
        NSLayoutConstraint.activate([
            
            cardContainerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            cardContainerView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            cardContainerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            cardContainerView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImage.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            
            logoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            logoImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 75),
            logoImage.heightAnchor.constraint(equalToConstant: 50),
            logoImage.widthAnchor.constraint(equalToConstant: 50),
            
            titleLabel.centerYAnchor.constraint(equalTo: logoImage.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: 10),
            
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),

            emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -10),
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            emailTextField.widthAnchor.constraint(equalToConstant: 320),
            
            passwordTextField.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -30),
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45),
            passwordTextField.widthAnchor.constraint(equalToConstant: 320),
            
            loginButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -10),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            loginButton.widthAnchor.constraint(equalToConstant: 320),
            
            registerButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            registerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 45),
            registerButton.widthAnchor.constraint(equalToConstant: 320),
            
//            appleLoginButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 20),
//            appleLoginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
//            appleLoginButton.heightAnchor.constraint(equalToConstant: 20),
//            appleLoginButton.widthAnchor.constraint(equalToConstant: 200),
//            
//            appleImage.centerYAnchor.constraint(equalTo: appleLoginButton.centerYAnchor),
//            appleImage.leadingAnchor.constraint(equalTo: appleLoginButton.leadingAnchor, constant: 20),
//            appleImage.heightAnchor.constraint(equalToConstant: 15),
//            appleImage.widthAnchor.constraint(equalToConstant: 13),
//            
//            googleLoginButton.topAnchor.constraint(equalTo: appleLoginButton.bottomAnchor, constant: 10),
//            googleLoginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
//            googleLoginButton.heightAnchor.constraint(equalToConstant: 20),
//            googleLoginButton.widthAnchor.constraint(equalToConstant: 200),
//            
//            googleImage.centerYAnchor.constraint(equalTo: googleLoginButton.centerYAnchor),
//            googleImage.leadingAnchor.constraint(equalTo: googleLoginButton.leadingAnchor, constant: 20),
//            googleImage.heightAnchor.constraint(equalToConstant: 15),
//            googleImage.widthAnchor.constraint(equalToConstant: 15),
//        
        ])
    }
}
