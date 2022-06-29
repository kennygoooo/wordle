//
//  TitleView.swift
//  Wordle-Like-iOS-Game
//
//  
//

import SwiftUI

struct TitleView: View {
    
    @State private var showHowToPlay = false
    @State private var showSettings = false
    @Binding var wordle: Wordle
    
    var body: some View {
        ZStack {
            Text("Guess Animal")
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
            
            HStack(spacing: 5) {
                Button {
                    showHowToPlay = true
                } label: {
                    Text(Image(systemName: "questionmark.circle"))
                        .bold()
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                Button {
                    showSettings = true
                } label: {
                    Text(Image(systemName: "gearshape.fill"))
                        .bold()
                        .foregroundColor(.white)
                }
            }
            .font(.title)
        }
        .sheet(isPresented: $showHowToPlay) {
            HowToPlayView()
        }
        .sheet(isPresented: $wordle.showResult) {
            ResultView(wordle: $wordle)
        }
        .fullScreenCover(isPresented: $showSettings) {
            SettingsView(wordle: $wordle, showSettings: $showSettings)
        }
    }
}
