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
    @State var GoalAccent = Color(.red)
    
    var body: some View {
        
        NavigationStack{
            VStack{
                //header of page
                
                //new goal pop up
                if showNewGoal{
                    NewGoalView(title:"",showNewGoal:$showNewGoal)
                }
                else{
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
                
                        ForEach(Goals){
                            Goal in
                            
                                NavigationLink(destination: GoalInfoView(title : Goal.title ?? "error")) {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(red:Goal.aRed,green: Goal.aGreen,blue: Goal.aBlue),lineWidth:10)
                                        
                                        Text(Goal.title ?? "no title")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .frame(height: 150.0)
                                            .foregroundColor(Color(red:Goal.aRed,green: Goal.aGreen,blue: Goal.aBlue))
                                    }
                                    .frame(width: 250.0, height: 200.0)
                                    
                                    
                                
                                .padding(.all)
                        }
                           
                    }
                    Spacer()
                }
                
            }
        }
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }

