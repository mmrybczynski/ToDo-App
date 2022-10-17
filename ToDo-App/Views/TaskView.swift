//
//  TaskView.swift
//  ToDo-App
//
//  Created by Mateusz Rybczyński on 17/10/2022.
//

import SwiftUI

struct TaskView: View {
    
    
    var body: some View {
        
        ZStack {
            
            Color.black.ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("My tasks")
                        .font(.title).bold()
                        .padding()
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text("Show completed")
                        .font(.caption)
                        .padding()
                        .foregroundColor(.white)
                }
                
                List {
                    Text("Hello")
                    
                }
                .scrollContentBackground(.hidden)
                //.listRowBackground((index  % 2 == 0) ? Color(.systemBlue) : Color(.yellow))
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        
        
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
