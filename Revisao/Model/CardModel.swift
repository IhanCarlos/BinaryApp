//
//  CardModel.swift
//  BinaryBank
//
//  Created by ihan carlos on 28/03/23.
//

import Foundation

struct cardDatail{
    var titleState: String?
    var nameImage: String
    var saldoTitle: String?
    var simbol: String
    
}

var CardData = [
    
    cardDatail(
        titleState: "Saldo em Conta",
        nameImage: "brasil",
        saldoTitle: "40.248,98",
        simbol: "brazilianrealsign.circle.fill"
    ),
    
    cardDatail(
        titleState: "Saldo em Conta Global Dólar",
        nameImage: "eud",
        saldoTitle: "2.378,22",
        simbol: "banknote.fill"
    ),
    
    cardDatail(
        titleState: "Saldo em Conta Global Euro",
        nameImage: "europan",
        saldoTitle: "1.990,02",
        simbol: "eurosign.circle.fill"
    )
]

