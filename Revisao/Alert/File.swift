//
//  File.swift
//  BinaryApp
//
//  Created by ihan carlos on 10/04/23.
//

import Foundation
import UIKit

class Alert:NSObject{
    var controller:UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func getAlert(title:String, mensagem:String, complition:(()-> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: mensagem, preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Ok", style: .cancel) { action in
            complition?()
        }
        alertController.addAction(cancel)
        controller.present(alertController, animated: true)
    }
}
