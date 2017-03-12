//
//  ConnectFourPiece.swift
//  Connectfour
//
//  Created by Sandeep Penchala on 3/12/17.
//  Copyright © 2017 Sandeep Penchala. All rights reserved.
//

import Foundation
class ConnectFourPiece: NSObject {
    var gamePieceColor:ConnectFourGamePieceColor
    init(withColor color: ConnectFourGamePieceColor) {
        gamePieceColor = color
    }
}
enum ConnectFourGamePieceColor: Int {
    case
    Undefined,
    Yellow,
    Red
}
