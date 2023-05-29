//
//  AccountMovementsView.swift
//  BinaryApp
//
//  Created by ihan carlos on 03/05/23.
//

import UIKit

class AccountMovementsView: UIView {

    lazy var extractImage:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "newspaper.fill")
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.tintColor = .black
        image.backgroundColor = .orange
        
        return image
    }()
    
    lazy var labelExtrato: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Extrato"
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    lazy var transfersImage:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "arrow.left.arrow.right.square.fill")
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.tintColor = .black
        image.backgroundColor = .orange
        
        return image
    }()
    
    lazy var labelTransfers: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Transferir"
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    lazy var payImage:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "camera.metering.partial")
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.tintColor = .black
        image.backgroundColor = .orange
        
        return image
    }()
    
    lazy var labelPay: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pagar"
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    lazy var seguryImage:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "lock.circle.fill")
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.tintColor = .black
        image.backgroundColor = .orange
        
        return image
    }()
    
    lazy var labelSegury: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Segurança"
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    lazy var moreImage:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "hand.point.up.braille.fill")
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.tintColor = .black
        image.backgroundColor = .orange
        
        return image
    }()
    
    lazy var labelMore: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mais"
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label.textColor = .black
        
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        setUpConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        addSubview(extractImage)
        addSubview(labelExtrato)
        addSubview(transfersImage)
        addSubview(labelTransfers)
        addSubview(payImage)
        addSubview(labelPay)
        addSubview(seguryImage)
        addSubview(labelSegury)
        addSubview(moreImage)
        addSubview(labelMore)
    }
    
        private func setUpConstraints() {
            NSLayoutConstraint.activate([
                extractImage.topAnchor.constraint(equalTo: topAnchor, constant: 5),
                extractImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                extractImage.heightAnchor.constraint(equalToConstant: 50),
                extractImage.widthAnchor.constraint(equalToConstant: 50),
            ])
            ConstraintsLabels(label: labelExtrato, reference: extractImage)
            
            ConstraintsButtons(to: transfersImage, reference: extractImage)
            ConstraintsLabels(label: labelTransfers, reference: transfersImage)
            
            ConstraintsButtons(to: payImage, reference: transfersImage)
            ConstraintsLabels(label: labelPay, reference: payImage)
            
            ConstraintsButtons(to: seguryImage, reference: payImage)
            ConstraintsLabels(label: labelSegury, reference: seguryImage)
            
            ConstraintsButtons(to: moreImage, reference: seguryImage)
            ConstraintsLabels(label: labelMore, reference: moreImage)
        }
}
