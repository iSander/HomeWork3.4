//
//  ContentView.swift
//  HomeWork3.4
//
//  Created by Alex Sander on 01.08.2020.
//  Copyright © 2020 Alex Sander. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentValue: Double
    @State var targetValue = Int.random(in: 0...100)
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            Text("Подвинь слайдер, как можно ближе к: \(targetValue)")
            
            HStack {
                Text("0")
                UIKitSlider(value: $currentValue)
                    .colorMultiply(.blue)
                    .opacity(Double(computeScore())/100.0)
                Text("100")
            }
            
            Button(action: { self.showingAlert = true }) {
                Text("Проверь меня!")
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Your Score"), message: Text("\(computeScore())"), dismissButton: .default(Text("OK")))
            }
            .padding()
            
            Button(action: {
                self.targetValue = Int.random(in: 0...100)
            }) {
                Text("Начать заново!")
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(currentValue: 50)
    }
}
