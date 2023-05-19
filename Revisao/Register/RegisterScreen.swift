//
//  RegisterScreen.swift
//  Revisao
//
//  Created by ihan carlos on 05/04/23.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject {
    func actionBackButton()
    func actionRegisterButton()
}

class RegisterScreen: UIView {
    
    weak private var delegate: RegisterScreenProtocol?
    
    func delegate(delegate:RegisterScreenProtocol?){
        self.delegate = delegate
    }
    
    lazy var cardContainerView: UIView = {
        let c = UIView()
        c.translatesAutoresizingMaskIntoConstraints = false
        return c
    }()
    
    lazy var backgroundImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "BkRegister")
        return img
    }()
    
    lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        return btn
    }()
    
    lazy var imageButton: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "chevron.backward.circle.fill")
        img.tintColor = .lightGray
        return img
    }()
    
    lazy var logoImage: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "logoBinarySemFundo")
        return img
    }()
    
    lazy var titleLabel: UILabel = {
       let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .white
        l.text = "Binary"
        l.textColor = .darkGray
        l.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return l
    }()
    
    lazy var emailTextField:UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.autocorrectionType = .no
        txt.backgroundColor = .white
        txt.borderStyle = .roundedRect
        txt.keyboardType = .emailAddress
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
        txt.keyboardType = .default
        txt.placeholder = "Digite sua senha"
        txt.isSecureTextEntry = true
        txt.textColor = .darkGray
        txt.layer.shadowOpacity = 1
        txt.layer.shadowOffset = CGSize(width: 0, height: -2)
        txt.layer.shadowRadius = 10
        return txt
    }()
    
    lazy var passwordConfirmedTextField:UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.autocorrectionType = .no
        txt.backgroundColor = .white
        txt.borderStyle = .roundedRect
        txt.keyboardType = .default
        txt.placeholder = "Confirme sua senha"
        txt.textColor = .darkGray
        txt.layer.shadowOpacity = 1
        txt.layer.shadowOffset = CGSize(width: 0, height: -2)
        txt.layer.shadowRadius = 10
        return txt
    }()
    
    lazy var cpfTextField:UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.autocorrectionType = .no
        txt.backgroundColor = .white
        txt.borderStyle = .roundedRect
        txt.keyboardType = .numberPad
        txt.placeholder = "CPF 000.000.000-00"
        txt.textColor = .darkGray
        txt.layer.shadowOpacity = 1
        txt.layer.shadowOffset = CGSize(width: 0, height: -2)
        txt.layer.shadowRadius = 10
        return txt
    }()
    
    lazy var yearsTextField:UIDatePicker = {
        let txt = UIDatePicker()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.backgroundColor = .white
        txt.datePickerMode = .date
        txt.layer.shadowOpacity = 1
        txt.layer.shadowOffset = CGSize(width: 0, height: -2)
        txt.layer.shadowRadius = 10
        return txt
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(cardContainerView)
        cardContainerView.addSubview(backgroundImage)
        cardContainerView.addSubview(backButton)
        cardContainerView.addSubview(imageButton)
        cardContainerView.addSubview(logoImage)
        cardContainerView.addSubview(titleLabel)
        cardContainerView.addSubview(emailTextField)
        cardContainerView.addSubview(passwordTextField)
        cardContainerView.addSubview(passwordConfirmedTextField)
        cardContainerView.addSubview(cpfTextField)
        cardContainerView.addSubview(yearsTextField)
        cardContainerView.addSubview(registerButton)
    }
    
    public func configtextfieldDelegate(delegate: UITextFieldDelegate) {
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
        self.passwordConfirmedTextField.delegate = delegate
        self.cpfTextField.delegate = delegate
       // self.yearsTextField.delegate = delegate
    }
    
    @objc private func tappedBackButton() {
        self.delegate?.actionBackButton()
    }
    
    @objc private func tappedRegisterButton() {
        self.delegate?.actionRegisterButton()
    }
    
    public func validTextFiels() {
        let email:String = self.emailTextField.text ?? ""
        let password:String = self.passwordTextField.text ?? ""
        let passwordConfirmed:String = self.passwordConfirmedTextField.text ?? ""
        let cpfText:String = self.cpfTextField.text ?? ""
       // let years:String = self.yearsTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty && !passwordConfirmed.isEmpty && !cpfText.isEmpty {
            self.configButtonEnable(enable: true)
        }else{
            self.configButtonEnable(enable: false)
        }
    }
    
    private func configButtonEnable(enable:Bool) {
        if enable{
            self.registerButton.setTitleColor(.white, for: .normal)
            self.registerButton.isEnabled = true
        }else{
            self.registerButton.setTitleColor(UIColor(named: "DarkRed"), for: .normal)
            self.registerButton.isEnabled = false
        }
    }
    
    public func getEmail()-> String {
        return emailTextField.text ?? ""
    }
    
    public func getPassword()-> String {
        return passwordTextField.text ?? ""
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            cardContainerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            cardContainerView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            cardContainerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            cardContainerView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImage.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            backButton.heightAnchor.constraint(equalToConstant: 60),
            backButton.widthAnchor.constraint(equalToConstant: 60),
            
            imageButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            imageButton.centerXAnchor.constraint(equalTo: backButton.centerXAnchor),
            imageButton.heightAnchor.constraint(equalToConstant: 30),
            imageButton.widthAnchor.constraint(equalToConstant: 30),
            
            logoImage.leadingAnchor.constraint(equalTo: imageButton.trailingAnchor, constant: 5),
            logoImage.centerYAnchor.constraint(equalTo: imageButton.centerYAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 30),
            logoImage.widthAnchor.constraint(equalToConstant: 30),
            
            titleLabel.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: 2),
            titleLabel.centerYAnchor.constraint(equalTo: logoImage.centerYAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 120),
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            emailTextField.widthAnchor.constraint(equalToConstant: 320),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45),
            passwordTextField.widthAnchor.constraint(equalToConstant: 320),
            
            passwordConfirmedTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            passwordConfirmedTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordConfirmedTextField.heightAnchor.constraint(equalToConstant: 45),
            passwordConfirmedTextField.widthAnchor.constraint(equalToConstant: 320),
            
            cpfTextField.topAnchor.constraint(equalTo: passwordConfirmedTextField.bottomAnchor, constant: 20),
            cpfTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            cpfTextField.heightAnchor.constraint(equalToConstant: 45),
            cpfTextField.widthAnchor.constraint(equalToConstant: 320),
            
            yearsTextField.topAnchor.constraint(equalTo: cpfTextField.bottomAnchor, constant: 20),
            yearsTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            yearsTextField.heightAnchor.constraint(equalToConstant: 45),
            yearsTextField.widthAnchor.constraint(equalToConstant: 320),
        
            registerButton.topAnchor.constraint(equalTo: yearsTextField.bottomAnchor, constant: 10),
            registerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 45),
            registerButton.widthAnchor.constraint(equalToConstant: 320),
        
        ])
    }
}
