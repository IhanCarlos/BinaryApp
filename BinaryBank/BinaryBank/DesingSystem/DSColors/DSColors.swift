//
//  DSColors.swift
//
//  Created by ihan carlos on 06/09/23.
//

import Foundation
import UIKit

public enum Colors: String {
    
    case white = "#F0F3FA"
    case gray = "#D5DEEF"
    case veryLightBlue = "#B1C9EF"
    case lightBlue = "#*AAEE0"
    case mediumBlue = "#638ECB"
    case darkBlue = "#395886"
    case green = "#77E379"
    
    case lighGray = "#EAEAEA"
    case grayVeryLight = "#F0F1F2"
    case grayMedium = "#D9D9D9"
}

public extension UIColor {
    static func ds( _ color: Colors) -> UIColor {
        return UIColor(hexString: color.rawValue)
    }
}
