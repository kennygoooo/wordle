//
//  GameGridsView.swift
//  Wordle-Like-iOS-Game
//
//  
//

import SwiftUI

struct GameGridsView: View {
    
    @AppStorage("correctColor") var correctColor = Color(red: 108/255, green: 170/255, blue: 100/255)
    @AppStorage("wrongSpotColor") var wrongSpotColor = Color(red: 200/255, green: 180/255, blue: 88/255)
    @AppStorage("notInAnswerColor") var notInAnswerColor = Color.gray
    @AppStorage("letters") var letters = 5
    
    @State private var degree : Double = 0
    
    @Binding var wordle : Wordle
    
    var geometry : GeometryProxy
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(), count: letters)) {
            ForEach(0..<wordle.grids.count, id: \.self) { index in
                switch wordle.grids[index].type {
                case .blank:
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.gray, lineWidth: 3)
                        .frame(width: geometry.size.width/CGFloat(letters+1), height: geometry.size.width/CGFloat(letters+1))
                case .typing:
                    Text(String(wordle.grids[index].value))
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                        .frame(width: geometry.size.width/CGFloat(letters+1), height: geometry.size.width/CGFloat(letters+1))
                        .border(.gray, width: 3)
                        .cornerRadius(8)
                        .transition(.scale)
                case .correct:
                    Text(String(wordle.grids[index].value))
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: geometry.size.width/CGFloat(letters+1), height: geometry.size.width/CGFloat(letters+1))
                        .background(correctColor)
                        .cornerRadius(8)
                case .wrongSpot:
                    Text(String(wordle.grids[index].value))
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: geometry.size.width/CGFloat(letters+1), height: geometry.size.width/CGFloat(letters+1))
                        .background(wrongSpotColor)
                        .cornerRadius(8)
                case .notInAnswer:
                    Text(String(wordle.grids[index].value))
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: geometry.size.width/CGFloat(letters+1), height: geometry.size.width/CGFloat(letters+1))
                        .background(notInAnswerColor)
                        .cornerRadius(8)
                }
            }
        }
        .overlay {
            if (wordle.win != .playing) {
                Text(wordle.answer)
                    .bold()
                    .font(.title)
                    .padding()
                    .foregroundColor(.black)
                    .background(Color(red: 212/255, green: 214/255, blue: 218/255))
                    .cornerRadius(5)
            }
        }
    }
}
