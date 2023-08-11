//
//  GoalInfoView.swift
//  GoalTracker
//
//  Created by Jude Shorbaji on 8/11/23.
//

import SwiftUI

struct GoalInfoView: View {
    @State var title: String
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .font(.system(size: 40))
                    .fontWeight(.black)
                Spacer()
            }
            Text("progress bar")
            Text("Task List")
            
            Spacer()
        }
        .padding(.all)
    }
}

struct GoalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        GoalInfoView(title:"Test")
    }
}
