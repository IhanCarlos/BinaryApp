//
//  DSStrings.swift
//  BinaryBank
//
//  Created by ihan carlos on 31/01/24.
//

import Foundation

public enum DSStrings: String {
    case enter = "Entrar"
    case register = "Cadastrar-se"
    case emailPlaceHolder = "Digite seu email:"
    case passwordPlaceholder = "Digite sua senha:"
    case confirmedPasswordPlaceholder = "Confirme sua senha:"
    case cpfPlaceholder = "000.000.000-00"
    case binary = "Binary"
}

public extension String {
    static func ds(_ string: DSStrings) -> String {
        return NSLocalizedString(string.rawValue, comment: "")
    }
}
