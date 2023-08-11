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
    @State var accentred=0.0
    @State var accentgreen=0.0
    @State var accentblue=0.0
    var body: some View {
    
        VStack(){
            //UI
            HStack{
                Text("Whats Your Goal?")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15.0)
                    .foregroundColor(Color(red:accentred,green:accentgreen,blue:accentblue))
                
                Spacer()
            }
            
            TextField("Fly to the moon and back", text: $title)
                .padding(.horizontal, 20.0)
                .font(.system(size: 25))
                .fontWeight(.black)
            
            
            Divider()
            HStack{
                Button{
                    accentred=0.035
                    accentgreen=0.016
                    accentblue=0.275
                }label:{
                    Circle()
                        .frame(width: 50.0)
                        .foregroundColor(Color(red: 0.035, green: 0.016, blue: 0.275))
                    
                }
                Button{
                    accentred=0.286
                    accentgreen=0.427
                    accentblue=0.859
                }label:{
                    Circle()
                        .frame(width: 50.0)
                        .foregroundColor(Color(red: 0.286, green: 0.427, blue: 0.859))
                    
                }
                Button{
                    accentred=0.776
                    accentgreen=0.792
                    accentblue=0.929
                }label:{
                    Circle()
                        .frame(width: 50.0)
                        .foregroundColor(Color(red: 0.776, green: 0.792, blue: 0.929))
                    
                }
                Button{
                    accentred=0.024
                    accentgreen=0.737
                    accentblue=0.537
                }label:{
                    Circle()
                        .frame(width: 50.0)
                        .foregroundColor(Color(red: 0.024, green: 0.737, blue: 0.537))
                    
                }
                Button{
                    accentred=0.933
                    accentgreen=0.519
                    accentblue=0.203
                }label:{
                    Circle()
                        .frame(width: 50.0)
                        .foregroundColor(Color(red: 0.933, green: 0.519, blue: 0.203))
                    
                }
            }
            HStack{
                Text("Add Task")
                Spacer()
                Button("+") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                
            }
            Spacer()
            Button(action: {
                self.addGoal(title: self.title)
                self.showNewGoal=false
                
            }) {
                ZStack{
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/10.0/*@END_MENU_TOKEN@*/)
                        .stroke(Color(red:accentred,green:accentgreen,blue:accentblue))
                        .frame(width: 100.0, height: 50.0)
                        
                    Text("Create Goal")
                }
            }
        }
    }
    
    //Adds information to core data
    private func addGoal(title: String) {
        let goal = GoalItem(context: viewContext)
        goal.id = UUID()
        goal.title = title
        goal.aRed=accentred
        goal.aGreen=accentgreen
        goal.aBlue=accentblue
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
