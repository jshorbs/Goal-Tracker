//
//  NewGoalView.swift
//  GoalTracker
//
//  Created by Jude Shorbaji on 8/2/23.
//

import SwiftUI

struct NewGoalView: View {
    //connects to core data
    @Environment(\.managedObjectContext) var viewContext
    //establishes title and newgoaltoggle variables
    @State var title: String
    
    @Binding var showNewGoal : Bool
    var body: some View {
        VStack(){
            //UI
            Text("Whats Your Goal?")
            TextField("Fly to the moon and back", text: $title)
                .padding(.horizontal, 100.0)
            
            Button(action: {
                self.addGoal(title: self.title)
                self.showNewGoal=false
                
            }) {
                Text("Create Goal")
            }
        }
    }
    //Adds information to core data
    private func addGoal(title: String) {
        let goal = GoalItem(context: viewContext)
        goal.id = UUID()
        goal.title = title
        do {
                    try viewContext.save()
        } catch {
                    print(error)
        }
    }
}

struct NewGoalView_Previews: PreviewProvider {
    static var previews: some View {
        NewGoalView(title: "", showNewGoal: .constant(true))
    }
}
