//
//  ListRowView.swift
//  Todo
//
//  Created by Mateus Marinho on 04/11/22.
//

import SwiftUI

struct ListRowView: View {
    // MARK - PROPERTIES
    let todo: Todo
    
    // MARK - BODY
    var body: some View {
        HStack {
            Image(systemName: todo.isCompleted ? "checkmark.circle.fill" :  "circle")
                .foregroundColor(todo.isCompleted ? .green : .gray)
            Text(todo.title)
            Spacer()
        }
        .font(.title3 )
        .padding(.vertical, 8 )
    }
}


struct ListRowView_Previews: PreviewProvider {
    static var itemNotCompleted = Todo(title: "This is my item")
    static var itemCompleted = Todo(title: "This taks is completed", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(todo: itemNotCompleted)
            ListRowView(todo: itemCompleted)
                          
        }
        .environmentObject(ListViewModel())
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
