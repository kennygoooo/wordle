//
//  SettingsView.swift
//  Wordle-Like-iOS-Game
//
//  
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("correctColor") var correctColor = Color(red: 108/255, green: 170/255, blue: 100/255)
    @AppStorage("wrongSpotColor") var wrongSpotColor = Color(red: 200/255, green: 180/255, blue: 88/255)
    @AppStorage("notInAnswerColor") var notInAnswerColor = Color.gray
    @AppStorage("letters") var letters = 5
    
    @State private var showSafari = false
    
    @Binding var wordle : Wordle
    @Binding var showSettings : Bool
    
    var topics = ["Animal", "Fruit＆Food"]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("Game Type")) {
                        Picker(selection: $letters) {
                            ForEach(5...7, id: \.self) { num in
                                Text(String(num))
                            }
                        } label: {
                            Text("Letters")
                        }
                        .onChange(of: letters) { _ in
                            wordle.gameStart()
                        }
                    }
                    
                    Section(header: Text("Color")) {
                        ColorPicker("Correct Color", selection: $correctColor)
                        ColorPicker("Wrong Spot Color", selection: $wrongSpotColor)
                        ColorPicker("Not In Answer Color", selection: $notInAnswerColor)
                    }
                }
                .listStyle(.grouped)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showSettings = false
                    } label: {
                        Text(Image(systemName: "chevron.backward"))
                            .font(.headline)
                        Text("Back")
                            .font(.title3)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Settings")
                        .bold()
                        .font(.title2)
                }
            }
            .fullScreenCover(isPresented: $showSafari) {
                SafariView(url: URL(string: "https://twitter.com/5j_54d93")!)
            }
        }
    }
}
