//
//  HomeViewController.swift
//  BinaryApp
//
//  Created by ihan carlos on 29/04/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeScreen:HomeSreen?
    
    override func loadView() {
        self.homeScreen = HomeSreen()
        self.view = homeScreen
        view.backgroundColor = .lightGray
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
       
    }
}

extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell:CardTableViewCell? = tableView.dequeueReusableCell(withIdentifier: CardTableViewCell.identifier, for: indexPath) as? CardTableViewCell
            cell!.separatorInset = UIEdgeInsets.zero
            cell!.layoutMargins = UIEdgeInsets.zero
            
            return cell ?? UITableViewCell()
        }else {
            let cell:AccountMovementsTableViewCell? = tableView.dequeueReusableCell(withIdentifier: AccountMovementsTableViewCell.identifier, for: indexPath) as? AccountMovementsTableViewCell
            cell!.separatorInset = UIEdgeInsets.zero
            cell!.layoutMargins = UIEdgeInsets.zero
            
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}
