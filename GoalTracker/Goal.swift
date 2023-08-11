//
//  Goal.swift
//  GoalTracker
//
//  Created by Jude Shorbaji on 8/2/23.
//

import Foundation
import SwiftUI

class Goal:Identifiable{
    var id=UUID()
    var title=""
    var aColor=""
    init(title: String, aColor: String) {
        self.title = title
        self.aColor = aColor
        
    }
}
