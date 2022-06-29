//
//  ContentView.swift
//  Wordle-Like-iOS-Game
//
//  
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("letters") var letters = 5
    
    @State private var wordle = Wordle()
    @State private var timer: Timer?
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                TitleView(wordle: $wordle)
                Spacer()
                GameGridsView(wordle: $wordle, geometry: geometry)
                Spacer()
                KeyBoardView(wordle: $wordle, timer: $timer)
            }
            .padding(.horizontal)
            .padding(.bottom)
            .background {
                Color.black
                    .ignoresSafeArea()
            }
            .onAppear {
                if (wordle.grids[0] == Grid(value: " ", type: Grid.gridType.blank)) {
                    wordle.gameStart()
                }
                print(wordle.answer)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
