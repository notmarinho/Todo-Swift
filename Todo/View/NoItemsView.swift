//
//  NoItemsView.swift
//  Todo
//
//  Created by Mateus Marinho on 04/11/22.
//

import SwiftUI

struct NoItemsView: View {
    // MARK - PROPERTIES
    @State private var isAnimated: Bool = false
    
    // MARK - FUNCTIONS
    func addAnimation() {
        guard !isAnimated else { return  }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2)
                    .repeatForever()
            ) {
                isAnimated.toggle()
            }
        }
    }
    
    // MARK - BODY
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should press add button and add bunch of taks to do! ")
                    .font(.subheadline)
                
                NavigationLink(destination: AddView()) {
                    Text("Add something 🥳")
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(isAnimated ? .red : .accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.horizontal, isAnimated ? 30 : 50 )
                .scaleEffect(isAnimated ? 1.1 : 1)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView  {
            NoItemsView()
                .navigationTitle("Title")
        }
        
    }
}
