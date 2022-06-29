//
//  KeyBoardView.swift
//  Wordle-Like-iOS-Game
//
//  
//

import SwiftUI

struct KeyBoardView: View {
    
    @AppStorage("topic") var topic = "Animal"
    
    @Binding var wordle : Wordle
    @Binding var timer : Timer?
    
    var body: some View {
        HStack {
            ForEach(wordle.keyBoardFirstRow.indices, id: \.self) { i in
                Button {
                    if (wordle.index == 0 && timer == nil) {
                        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
                            wordle.time -= 1
                            if(wordle.time == 0) {
                                self.timer?.invalidate()
                            }
                        }
                    }
                    wordle.typing(key: wordle.keyBoardFirstRow[i].value)
                } label: {
                    DefaultKeyView(key: wordle.keyBoardFirstRow[i].value)
                }
                .cornerRadius(4)
            }
        }
        
        HStack {
            ForEach(wordle.keyBoardSecondRow.indices, id: \.self) { i in
                Button {
                    if (wordle.index == 0 && timer == nil) {
                        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
                            wordle.time -= 1
                            if(wordle.time == 0) {
                                self.timer?.invalidate()
                            }
                        }
                    }
                    wordle.typing(key: wordle.keyBoardSecondRow[i].value)
                } label: {
                    DefaultKeyView(key: wordle.keyBoardSecondRow[i].value)
                }
                .cornerRadius(4)
            }
        }
        .padding(.horizontal, 20)
        
        HStack {
            Button {
                wordle.checkAnswer()
            } label: {
                Text("ENTER")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(width: 70)
                    .padding(.vertical, 15)
                    .alert("Not a \(topic) word", isPresented: $wordle.showAlert, actions: {
                        Button("OK") {
                            wordle.showAlert = false
                        }
                    })
                    .sheet(isPresented: $wordle.showResult) {
                        ResultView(wordle: $wordle)
                    }
            }
            .background(Color(red: 212/255, green: 214/255, blue: 218/255))
            .cornerRadius(4)
            
            ForEach(wordle.keyBoardThirdRow.indices, id: \.self) { i in
                Button {
                    if (wordle.index == 0 && timer == nil) {
                        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
                            wordle.time -= 1
                            if(wordle.time == 0) {
                                self.timer?.invalidate()
                            }
                        }
                    }
                    wordle.typing(key: wordle.keyBoardThirdRow[i].value)
                } label: {
                    DefaultKeyView(key: wordle.keyBoardThirdRow[i].value)
                }
                .cornerRadius(4)
            }
            
            Button {
                wordle.delete()
            } label: {
                Text(Image(systemName: "delete.left"))
                    .bold()
                    .font(.title3)
                    .foregroundColor(.black)
                    .frame(width: 35)
                    .padding(.vertical, 15)
            }
            .background(Color(red: 212/255, green: 214/255, blue: 218/255))
            .cornerRadius(4)
        }
    }
}

struct DefaultKeyView: View {
    
    var key : Character
    
    var body: some View {
        Text(String(key))
            .font(.headline)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 15)
            .background(Color(red: 212/255, green: 214/255, blue: 218/255))
    }
}
