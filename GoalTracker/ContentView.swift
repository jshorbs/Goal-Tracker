//
//  ContentView.swift
//  GoalTracker
//
//  Created by Jude Shorbaji on 8/2/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //connect to core data
    @Environment(\.managedObjectContext) private var viewContext
    //New Goal pop up toggle
    @State private var showNewGoal=false
    
    //Fetch GoalItem entity data
    @FetchRequest(
            entity: GoalItem.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \GoalItem.id, ascending: false) ])
    
   //Creats array for list of goals
    var Goals: FetchedResults<GoalItem>
    
    var body: some View {
        VStack{
            //header of page
            HStack{
                Text("Goals")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                Spacer()
                Button(action: {
                       showNewGoal=true
                }) {
                Text("+")
                        .font(.system(size: 40))
                        .fontWeight(.black)
                        .foregroundColor(Color.black)
                }
            }
            .padding()
            //list of goals
            List {
                ForEach(Goals){
                    Goal in
                    Text(Goal.title ?? "no title")
                }
            }
            Spacer()
            //new goal pop up
            if showNewGoal{
                NewGoalView(title:"", showNewGoal:$showNewGoal)
            }
            
        }
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }

