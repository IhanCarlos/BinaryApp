//
//  Extension+UILabel.swift
//  AcademiaAltaProdutividade
//
//  Created by ihan carlos on 17/01/24.
//

import Foundation
import UIKit

extension UILabel {
    func setDualFontTextAndColor(primaryText: String, primaryFont: UIFont, primaryColor: UIColor, secondaryText: String, secondaryFont: UIFont, secondaryColor: UIColor) {
        let attributedString = NSMutableAttributedString(string: primaryText)
        attributedString.addAttributes([.font: primaryFont, .foregroundColor: primaryColor], range: NSRange(location: 0, length: primaryText.count))
        
        let secondaryAttributedString = NSAttributedString(string: secondaryText, attributes: [.font: secondaryFont, .foregroundColor: secondaryColor])
        attributedString.append(secondaryAttributedString)
        
        self.attributedText = attributedString
    }
    
    func setDualFontText(primaryText: String, primaryFont: UIFont, secondaryText: String, secondaryFont: UIFont) {
        let attributedString = NSMutableAttributedString(string: primaryText)
        attributedString.addAttributes([.font: primaryFont, .foregroundColor: UIColor.black], range: NSRange(location: 0, length: primaryText.count))
        
        let secondaryAttributedString = NSAttributedString(string: secondaryText, attributes: [.font: secondaryFont, .foregroundColor: UIColor.black])
        attributedString.append(secondaryAttributedString)
        
        self.attributedText = attributedString
    }
}
