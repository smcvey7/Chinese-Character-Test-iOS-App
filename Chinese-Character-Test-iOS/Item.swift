//
//  Item.swift
//  Chinese-Character-Test-iOS
//
//  Created by Steven McVey on 10/31/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
