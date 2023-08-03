//
//  Goal.swift
//  GoalTracker
//
//  Created by Jude Shorbaji on 8/2/23.
//

import Foundation

class Goal:Identifiable{
    var id=UUID()
    
    var title=""
    init(title: String) {
        self.title = title
        
    }
}
