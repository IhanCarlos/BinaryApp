//
//  DSMargem.swift
//
//  Created by ihan carlos on 31/01/24.
//

import Foundation
import UIKit

public enum DSMargin: CGFloat {
    case padding4 = 4
    case padding10 = 10
    case padding15 = 15
    case padding20 = 20
    case padding25 = 25
    case padding30 = 30
    case padding35 = 35
    case padding40 = 40
    case padding45 = 45
    case padding50 = 50
    case padding55 = 55
    case padding60 = 60
    case padding65 = 65
    case padding70 = 70
    case padding75 = 75
    case padding80 = 80
    case padding85 = 85
    case padding90 = 90
    case padding95 = 95
    case padding100 = 100
    case padding105 = 105
    case padding110 = 110
    case padding115 = 115
    case padding120 = 120
}

public extension CGFloat {
    static func dsMargin( _ margin: DSMargin) -> CGFloat {
        return margin.rawValue
    }
}
