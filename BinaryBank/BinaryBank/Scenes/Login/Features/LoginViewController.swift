//
//  LoginViewController.swift
//  BinaryBank
//
//  Created by ihan carlos on 31/01/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    var viewModel: LoginViewModel
    
    var registerButtonBottomConstraint: NSLayoutConstraint!
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var backgroundImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = .ds(.backgroundLogin)
        return image
    }()
    
    lazy var logoImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = .ds(.logo)
        return image
    }()
    
    lazy var emailTextField: CustomTextField = {
        let text = CustomTextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textField.keyboardType = .emailAddress
        text.textField.placeholder = .ds(.emailPlaceHolder)
        text.imageTextField.image = .ds(.logo)
        return text
    }()
    
    lazy var passwordTextField: CustomTextField = {
        let text = CustomTextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textField.keyboardType = .emailAddress
        text.textField.placeholder = .ds(.passwordPlaceholder)
        text.imageTextField.image = .ds(systemName: .eye)
        return text
    }()
    
    lazy var segurityButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(segurity), for: .touchUpInside)
        button.backgroundColor = .clear
        return button
    }()
    
    @objc func segurity(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        passwordTextField.textField.isSecureTextEntry = !sender.isSelected
    }
    
    lazy var loginButton: CustomButton = {
        let button = CustomButton(frame: .zero, style: .containedQuadDark)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(.ds(.enter), for: .normal)
        return button
    }()
    
    lazy var registerButton: CustomButton = {
        let button = CustomButton(frame: .zero, style: .borderButton)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(.ds(.register), for: .normal)
        button.addTarget(self, action: #selector(goToRegister), for: .touchUpInside)
        return button
    }()
    
    @objc func goToRegister() {
        viewModel.goToRegister()
    }
    
    lazy var loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .ds(.darkBlue)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let userInfo = notification.userInfo,
           let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            let alturaTeclado = keyboardFrame.height

            registerButtonBottomConstraint.constant = -alturaTeclado

            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        registerButtonBottomConstraint.constant = 0

        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}

extension LoginViewController: ViewCodeType {
    func buildViewHierarchy() {
        view.addSubview(backgroundImage)
        view.addSubview(containerView)
        containerView.addSubview(emailTextField)
        containerView.addSubview(passwordTextField)
        containerView.addSubview(segurityButton)
        containerView.addSubview(loginButton)
        containerView.addSubview(registerButton)
    }
    
    func setupConstraints() {
        
        registerButtonBottomConstraint = registerButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0)
        registerButtonBottomConstraint.isActive = true
        
        backgroundImage.anchor(
            top: view.topAnchor,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor
        )
        
        containerView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            left: view.leftAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            right: view.rightAnchor
        )
        
        emailTextField.anchor(
            left: view.leftAnchor,
            bottom: passwordTextField.topAnchor,
            right: view.rightAnchor,
            leftConstant: .dsMargin(.padding40),
            bottomConstant: .dsMargin(.padding10),
            rightConstant: .dsMargin(.padding40),
            heightConstant: .dsMargin(.padding55)
        )
        
        passwordTextField.anchor(
            left: emailTextField.leftAnchor,
            bottom: loginButton.topAnchor,
            right: emailTextField.rightAnchor,
            bottomConstant: .dsMargin(.padding10),
            heightConstant: .dsMargin(.padding55)
        )
        
        segurityButton.anchor(
            right: passwordTextField.rightAnchor,
            centerY: passwordTextField.centerYAnchor,
            widthConstant: .dsMargin(.padding40),
            heightConstant: .dsMargin(.padding40)
        )
        
        loginButton.anchor(
            left: passwordTextField.leftAnchor,
            bottom: registerButton.topAnchor,
            right: passwordTextField.rightAnchor,
            bottomConstant: .dsMargin(.padding10),
            heightConstant: .dsMargin(.padding50)
        )
        
        registerButton.anchor(
            left: loginButton.leftAnchor,
            bottom: containerView.bottomAnchor,
            right: loginButton.rightAnchor,
            bottomConstant: .dsMargin(.padding10),
            heightConstant: .dsMargin(.padding50)
        )
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .white
        registerForKeyboardNotifications()
        setupTapGesture()
        passwordTextField.textField.isSecureTextEntry = true
    }
}
