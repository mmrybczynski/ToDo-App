//
//  TaskView.swift
//  ToDo-App
//
//  Created by Mateusz Rybczyński on 17/10/2022.
//

import SwiftUI

extension UICollectionReusableView {
    override open var backgroundColor: UIColor? {
        get { .clear }
        set { }
    }
}

struct TaskView: View {
    
    init() {
        UICollectionView.appearance().backgroundColor = .clear
    }
    
    @EnvironmentObject var realmManager: RealmManager
    @State var showCompleted: Bool = false
    
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
                    
                    Text(!showCompleted ? "Show completed" : "Hide completed")
                        .font(.caption)
                        .padding()
                        .foregroundColor(.white)
                        .onTapGesture {
                            withAnimation(.linear(duration: 0.2)) {
                                showCompleted.toggle()
                            }
                            
                        }
                }
                
                List {
                    
                    if showCompleted {
                        taskViewSectionShowCompleted
                    } else {
                        taskViewSectionHideCompleted
                    }
                    
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
            .environmentObject(RealmManager())
    }
}

extension TaskView {
    private var taskViewSectionShowCompleted: some View {
        ForEach(realmManager.tasks, id: \.id) { task in
            
            if task.completed || !task.completed {
                if !task.isInvalidated {
                    
                    TaskRow(title: task.title, note: task.note ,completed: task.completed)
                        .onTapGesture {
                            realmManager.updateTask(id: task.id, completed: !task.completed)
                        }
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                realmManager.deleteTask(id: task.id)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                }
            }
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color.white.opacity(0.3))
    }
    
    private var taskViewSectionHideCompleted: some View {
        ForEach(realmManager.tasks, id: \.id) { task in
            
            if !task.completed {
                if !task.isInvalidated {
                    
                    TaskRow(title: task.title, note: task.note ,completed: task.completed)
                        .onTapGesture {
                            realmManager.updateTask(id: task.id, completed: !task.completed)
                        }
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                realmManager.deleteTask(id: task.id)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                }
            }
        }
        .listRowSeparator(.hidden)
    }
}
