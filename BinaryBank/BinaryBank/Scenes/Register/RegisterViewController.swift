//
//  RegisterViewController.swift
//  BinaryBank
//
//  Created by ihan carlos on 31/01/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var viewModel: RegisterViewModel
    
    lazy var backgroundImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = .ds(.backgroundRegister)
        return image
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(.ds(systemName: .backCircle), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.imageView?.tintColor = .ds(.grayMedium)
        button.addTarget(self, action: #selector(backScreen), for: .touchUpInside)
        return button
    }()
    
    @objc func backScreen() {
        viewModel.popView()
    }
    
    lazy var logoImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = .ds(.logo)
        return image
    }()
    
    lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = .ds(.binary)
        label.font = .dsFonts(.poppinsBold16)
        return label
    }()
    
    lazy var emailTextField: CustomTextField = {
        let text = CustomTextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textField.keyboardType = .emailAddress
        text.textField.placeholder = .ds(.emailPlaceHolder)
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
    
    lazy var confirmedPasswordTextField: CustomTextField = {
        let text = CustomTextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textField.keyboardType = .emailAddress
        text.textField.placeholder = .ds(.confirmedPasswordPlaceholder)
        text.imageTextField.image = .ds(systemName: .eye)
        return text
    }()
    
    lazy var cpfTextField: CustomTextField = {
        let text = CustomTextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textField.keyboardType = .emailAddress
        text.textField.placeholder = .ds(.cpfPlaceholder)
        return text
    }()
    
    lazy var yearsTextField: UIDatePicker = {
        let date = UIDatePicker()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.backgroundColor = .white
        date.datePickerMode = .date
        date.layer.cornerRadius = 6
        date.addShadow()
        return date
    }()
    
    init(viewModel: RegisterViewModel) {
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
    
}

extension RegisterViewController: ViewCodeType {
    func buildViewHierarchy() {
        view.addSubview(backgroundImage)
        view.addSubview(containerView)
        containerView.addSubview(backButton)
        containerView.addSubview(logoImage)
        containerView.addSubview(titleLabel)
        containerView.addSubview(emailTextField)
        containerView.addSubview(passwordTextField)
        containerView.addSubview(confirmedPasswordTextField)
        containerView.addSubview(cpfTextField)
        containerView.addSubview(yearsTextField)
    }
    
    func setupConstraints() {
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
        
        backButton.anchor(
            top: containerView.topAnchor,
            left: view.leftAnchor,
            topConstant: .dsMargin(.padding10),
            leftConstant: .dsMargin(.padding20)
        )
        
        logoImage.anchor(
            left: backButton.rightAnchor,
            centerY: backButton.centerYAnchor,
            leftConstant: .dsMargin(.padding4),
            widthConstant: .dsMargin(.padding20),
            heightConstant: .dsMargin(.padding20)
        )
        
        titleLabel.anchor(
            left: logoImage.rightAnchor,
            centerY: logoImage.centerYAnchor,
            leftConstant: .dsMargin(.padding10)
        )
        
        emailTextField.anchor(
            top: titleLabel.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            topConstant: .dsMargin(.padding40),
            leftConstant: .dsMargin(.padding20),
            rightConstant: .dsMargin(.padding20),
            heightConstant: .dsMargin(.padding55)
        )
        
        passwordTextField.anchor(
            top: emailTextField.bottomAnchor,
            left: emailTextField.leftAnchor,
            right: emailTextField.rightAnchor,
            topConstant: .dsMargin(.padding15),
            heightConstant: .dsMargin(.padding55)
        )
        
        confirmedPasswordTextField.anchor(
            top: passwordTextField.bottomAnchor,
            left: passwordTextField.leftAnchor,
            right: passwordTextField.rightAnchor,
            topConstant: .dsMargin(.padding15),
            heightConstant: .dsMargin(.padding55)
        )
        
        cpfTextField.anchor(
            top: confirmedPasswordTextField.bottomAnchor,
            left: confirmedPasswordTextField.leftAnchor,
            right: confirmedPasswordTextField.rightAnchor,
            topConstant: .dsMargin(.padding15),
            heightConstant: .dsMargin(.padding55)
        )
        
        yearsTextField.anchor(
            top: cpfTextField.bottomAnchor,
            left: cpfTextField.leftAnchor,
            topConstant: .dsMargin(.padding40),
            widthConstant: .dsMargin(.padding100),
            heightConstant: .dsMargin(.padding30)
        )
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .white
        setupTapGesture()
    }
}
