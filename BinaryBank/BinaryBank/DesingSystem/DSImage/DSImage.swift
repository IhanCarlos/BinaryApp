//
//  DSImage.swift
//
//  Created by ihan carlos on 06/09/23.
//

import Foundation
import UIKit

public enum DSSystemImages: String {
    case eye = "eye.slash"
    case backCircle = "chevron.backward.circle.fill"
}

public enum DSImages: String {
    case logo = "logoBinarySemFundo"
    case backgroundLogin = "Binary"
    case card = "BinaryCard"
    case backgroundRegister = "BkRegister"
}

public extension UIImage {
    static func ds(_ image: DSImages) -> UIImage {
        return UIImage(named: image.rawValue) ?? UIImage()
    }

    @available(iOS 13.0, *)
    static func ds(systemName: DSSystemImages) -> UIImage {
        return UIImage(systemName: systemName.rawValue) ?? UIImage()
    }
}
