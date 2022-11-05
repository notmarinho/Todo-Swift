//
//  ListView.swift
//  Todo
//
//  Created by Mateus Marinho on 04/11/22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            } else {
                List {
                    ForEach(listViewModel.items) { todo in
                        ListRowView(todo: todo)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    listViewModel.updateItem(todo: todo)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.onDeleteTodo)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}

