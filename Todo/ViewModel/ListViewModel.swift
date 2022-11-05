//
//  ListViewModel.swift
//  Todo
//
//  Created by Mateus Marinho on 04/11/22.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [Todo] = [] {
        didSet {
            saveItems()
        }
    }
    
    let items_key = "items_list"
    
    
    init() {
        getNewItems()
    }
    
    func getNewItems() {
        guard
            let data = UserDefaults.standard.data(forKey: items_key),
            let savedItems = try? JSONDecoder().decode([Todo].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func onDeleteTodo(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        items.append(Todo(title: title))
    }
    
    func updateItem(todo: Todo) {
        if let index = items.firstIndex(where: { $0.id == todo.id }) {
            items[index] = todo.updateCompletion()
        }
    }
    
    func saveItems() {
        // This works like AsyncStorage
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: items_key)
        }
    }
}
