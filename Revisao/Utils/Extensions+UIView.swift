//
//  Extensions+Constraints.swift
//  BinaryApp
//
//  Created by ihan carlos on 29/05/23.
//

import UIKit

extension UIView {
    func ConstraintsButtons(to imageView: UIImageView, reference: UIImageView) {
        imageView.leadingAnchor.constraint(equalTo: reference.trailingAnchor, constant: 20).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func ConstraintsLabels(label: UILabel, reference: UIImageView) {
        label.topAnchor.constraint(equalTo: reference.bottomAnchor, constant: 5).isActive = true
        label.centerXAnchor.constraint(equalTo: reference.centerXAnchor).isActive = true
    }
}
