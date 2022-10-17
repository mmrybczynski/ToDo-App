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
                .foregroundColor(.black)
                .padding()
            
            
            if note.isEmpty {
                Text(title)
                    .foregroundColor(.black)
                    .font(.system(size: 19, weight: .bold))
            } else {
                VStack(alignment: .leading) {
                    Text(title)
                        .foregroundColor(.black)
                        .font(.system(size: 19, weight: .bold))

                    Text(note)
                        .foregroundColor(.black)
                        .font(.system(size: 12, weight: .light))
                       
                }
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
