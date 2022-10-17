//
//  AddTaskView.swift
//  ToDo-App
//
//  Created by Mateusz Rybczyński on 17/10/2022.
//

import SwiftUI

struct AddTaskView: View {
    
    @EnvironmentObject var realmManager: RealmManager
    @State var title: String = ""
    @State var note: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                
                Text("Add task")
                    .foregroundColor(.white)
                    .font(.system(.title))
                
                Spacer()
                
                HStack {
                    Text("title")
                        .foregroundColor(.white)
                        .padding()
                    
                    Spacer()
                }
                
                TextField("", text: $title)
                    .frame(width: .infinity, height:  20)
                    .padding()
                    .background(Color.white.opacity(0.3))
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                
                
                HStack {
                    Text("Tote")
                        .foregroundColor(.white)
                        .padding()
                    
                    Spacer()
                }
                
                TextField("Note", text: $note)
                    .frame(width: .infinity, height:  20)
                    .padding()
                    .background(Color.white.opacity(0.3))
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                
                Button {
                    if !title.isEmpty {
                        realmManager.addTask(taskTitle: title, taskNote: note)
                        print("Task added")
                    }
                    dismiss()
                } label: {
                    Text("Add task")
                        .frame(width: 120, height:  20)
                        .padding(10)
                        .background(Color.cyan)
                        .cornerRadius(20)
                        .foregroundColor(.white)
                        .padding(.top, 40)
                        .padding(.bottom)
                    
                }

                    
            }
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
