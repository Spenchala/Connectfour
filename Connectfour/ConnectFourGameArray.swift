//
//  2DArray.swift
//  Connectfour
//
//  Created by Sandeep Penchala on 3/12/17.
//  Copyright © 2017 Sandeep Penchala. All rights reserved.
//

import Foundation
//Constructs 2D array with rows*columns
struct ConnectfourGameArray<T> {
    let columns: Int
    let rows: Int
    private var array: Array<T?>
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        array = Array<T?>(repeating: nil, count: rows * columns)
    }
    
    subscript(column: Int, row: Int) -> T? {
        get {
            return array[row * columns + column]
        }
        set {
            array[row * columns + column] = newValue
        }
    }
}
