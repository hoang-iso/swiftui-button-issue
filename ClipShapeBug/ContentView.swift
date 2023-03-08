//
//  ContentView.swift
//  ClipShapeBug
//
//  Created by Hoang Pham on 08/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var offsetX: CGFloat = 0
    @State private var offsetY: CGFloat = 0
    @State private var didStep1: Bool = false
    @State private var didStep2: Bool = false
    
    var body: some View {
        renderMain()
    }
    
    @ViewBuilder
    private func renderMain() -> some View {
        VStack {
            NavigationView { // Required for bug
                VStack {
                    Button {
                        didStep1 = true
                    } label: {
                        Text("(1) Tap me. I'm tappable!")
                            .padding()
                            .background(Color.yellow)
                    }
                    if !didStep2 {
                        Button("(2) Move to the right") {
                            withAnimation {
                                offsetX = 100
                            }
                            didStep2 = true
                        }
                        .foregroundColor(.red)
                        .padding()
                    } else {
                        Text("(3) Hit area messed up!\nNow you can tap on the left\nof the button above!")
                    }
                }
                .navigationViewStyle(.stack)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .cornerRadius(20)  // Required for bug
        .offset(x: offsetX, y: offsetY)
        .background(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
