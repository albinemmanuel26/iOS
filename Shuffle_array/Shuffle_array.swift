//
//  Shuffle_array.swift
//
//  Created by Albin Emmanuel on 10/30/17.
//  Copyright © 2017 Albin Emmanuel. All rights reserved.
//

import Foundation

/**
 Extend array to enable random shuffling
 */
extension Array {
    /**
     Randomizes the order of an array's elements
     */
    mutating func shuffle() {
        for _ in 0..<count {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}
