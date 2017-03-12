//
//  Game.swift
//  Connectfour
//
//  Created by Sandeep Penchala on 3/12/17.
//  Copyright © 2017 Sandeep Penchala. All rights reserved.
//

import Foundation
let MatchingPieces = 4

//This holds the logic for Game and have all the Game state changes
class ConnectfourGame: NSObject{
    fileprivate var gameBoard: ConnectfourGameArray<ConnectFourPiece>?
    var numRows:Int
    var numColumns:Int
    var isGameFinished = false
    init(columns:Int, rows: Int) {
        gameBoard = ConnectfourGameArray(columns: columns, rows: rows)
        numRows = rows
        numColumns = columns
    }
    
    fileprivate func pieceonBoard(at column:Int, row:Int)->ConnectFourPiece? {
        return gameBoard?[column, row]
    }
    
    fileprivate func gamePieceColorOnBoard(at column:Int, row:Int) -> ConnectFourGamePieceColor?{
        if column < 0 || row < 0 || column > numColumns - 1 || row > numRows - 1 {
            return ConnectFourGamePieceColor.Undefined
        }
        
        if pieceonBoard(at: column, row: row) == nil {
            return ConnectFourGamePieceColor.Undefined
        } else {
            let connectFourPiece = pieceonBoard(at: column, row: row)
            return connectFourPiece?.gamePieceColor
        }
    }
    
    //Check for Matching in a row/column/diagonal
    fileprivate func checkForMatching(at column: Int, row:Int, x:Int, y:Int)->Bool{
        let pieceStartColor = gamePieceColorOnBoard(at: column, row: row)
        for index in 0..<MatchingPieces{
            let newX = row + index * x
            let newY = column + index * y
            if(gamePieceColorOnBoard(at: newY, row: newX) == ConnectFourGamePieceColor.Undefined) {
                return false
            }
            
            if (pieceStartColor != gamePieceColorOnBoard(at: newY, row: newX)) {
                return false
            }
        }
        return true
    }
    
    //Add a game piece to the board if it is Undefined/nil on the board
    func addpieceToBoard(column:Int, row:Int, color:ConnectFourGamePieceColor){
        let gamePiece = pieceonBoard(at: column, row: row)
        if gamePiece == nil || gamePiece?.gamePieceColor == .Undefined{
            let newPiece = ConnectFourPiece(withColor: color)
            gameBoard?[column, row] = newPiece
        }
    }
    
    //Check the win condition when user add piece on the board
    func checkForWin() -> Bool{
        for row in 0..<numRows {
            for column in 0..<numColumns {
                //horizontal
                if(checkForMatching(at: column, row: row, x: 1, y: 0)) {
                    isGameFinished = true
                }
                
                //vertical
                if(checkForMatching(at: column, row: row, x: 0, y: 1)) {
                    isGameFinished = true
                }
                
                //diagonal
                if(checkForMatching(at: column, row: row, x: 1, y: 1)) {
                    isGameFinished = true
                }
                
                //second diagonal
                if(checkForMatching(at: column, row: row, x: 1, y: -1)) {
                    isGameFinished = true
                }
            }
            
        }
        return isGameFinished
    }
}
