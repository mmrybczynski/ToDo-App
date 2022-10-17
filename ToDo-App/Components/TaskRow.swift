//
//  TaskRow.swift
//  ToDo-App
//
//  Created by Mateusz Rybczyński on 17/10/2022.
//

import SwiftUI

struct TaskRow: View {
    var title: String
    var note: String = ""
    var completed: Bool
    
    var body: some View {
        HStack {
            Image(systemName: completed ? "checkmark.circle" : "circle")
                .padding()
            
            
            if note.isEmpty {
                Text(title)
                    .font(.system(size: 19, weight: .bold))
            } else {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: 19, weight: .bold))

                    Text(note)
                        .font(.system(size: 12, weight: .light))
                       
                }
                .padding()
            }
            
            Spacer()
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(title: "Do homewoark", note: "Mat", completed: false)
    }
}
