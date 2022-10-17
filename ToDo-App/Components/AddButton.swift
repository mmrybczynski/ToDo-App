//
//  AddButton.swift
//  ToDo-App
//
//  Created by Mateusz Rybczyński on 17/10/2022.
//

import SwiftUI

struct AddButton: View {
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(19)
                .foregroundColor(Color.cyan)
            
            Text("+")
                .font(.system(size: 30))
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }
        .frame(width: 50,height: 50)
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton()
    }
}
