//
//  Show.swift
//  Attics
//
//  Created by Zachary Wood on 6/15/18.
//  Copyright © 2018 Zachary Wood. All rights reserved.
//

import Foundation

struct Show: Equatable {
    let id: Int
    let date: String
    let venue: String
    let city: String
    let state: String
    let stars: Double
    let sources: Int
    let avgRating: Double
    let year: Year
}
