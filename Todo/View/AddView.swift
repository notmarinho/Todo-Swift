//
//  AddView.swift
//  Todo
//
//  Created by Mateus Marinho on 04/11/22.
//

import SwiftUI

struct AddView: View {
    // MARK - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State private var newTodoValue: String = ""
    @State private var showAlert: Bool = false
    
    func onAddPress() {
        if !newTodoValue.isEmpty, newTodoValue.count > 3 {
            listViewModel.addItem(title: newTodoValue)
            newTodoValue = ""
            presentationMode.wrappedValue.dismiss() // Navigate Back
        } else {
            showAlert.toggle()
        }
    }
    // MARK - BODY
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $newTodoValue)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.systemGray5))
                .cornerRadius(12)
                
                Button(action: onAddPress) {
                    Text("Save".uppercased())
                        .font(.headline )
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Add an Item ✒️")
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Valor inválido"))
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
                .environmentObject(ListViewModel())
        }
    }
}
