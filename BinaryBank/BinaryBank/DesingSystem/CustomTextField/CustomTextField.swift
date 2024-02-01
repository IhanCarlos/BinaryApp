//
//  CustomTextField.swift
//  BinaryBank
//
//  Created by ihan carlos on 31/01/24.
//

import UIKit

class CustomTextField: UIView {
    
    lazy var borderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.ds(.darkBlue).cgColor
        view.layer.cornerRadius = 25
        view.backgroundColor = .white.withAlphaComponent(0.70)
        view.addShadow()
        return view
    }()
    
    lazy var textField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.autocorrectionType = .no
        text.delegate = self
        return text
    }()
    
    lazy var imageTextField: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .black
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomTextField: ViewCodeType {
    func buildViewHierarchy() {
        addSubview(borderView)
        addSubview(textField)
        addSubview(imageTextField)
    }
    
    func setupConstraints() {
        borderView.anchor(
            top: topAnchor,
            left: leftAnchor,
            right: rightAnchor,
            heightConstant: 50
        )
        
        textField.anchor(
            left: borderView.leftAnchor,
            right: imageTextField.leftAnchor,
            centerY: borderView.centerYAnchor,
            leftConstant: 20,
            rightConstant: 5,
            heightConstant: 20
        )
        
        imageTextField.anchor(
            right: borderView.rightAnchor,
            centerY: borderView.centerYAnchor,
            rightConstant: 20,
            widthConstant: 20,
            heightConstant: 20
        )
    }
}

extension CustomTextField: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
