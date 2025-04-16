//
//  ContentView.swift
//  XOPaws
//
//  Created by Mirabella on 16/04/25.
//

import SwiftUI

struct ContentView: View {
    @State private var board = Array(repeating: "", count: 9)
    @State private var isXTurn = true
    @State private var winner: String? = nil
    
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        VStack(spacing: 20) {
            Text("XOpaws🐾")
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .bold()
            
            Text(winner == nil ? "\(isXTurn ? "🐶" : "🐱")" : "")
                .font(.title2)
            
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(0..<9) { index in
                    Button(action: {
                        if board[index] == "" && winner == nil {
                            board[index] = isXTurn ? "🐶" : "🐱"
                            isXTurn.toggle()
                            checkWinner()
                        }
                    }) {
                        ZStack {
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 80, height: 80)
                                .cornerRadius(10)
                                .shadow(radius: 2)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray.opacity(0.3), lineWidth: 0.5)
                                )
                            Text(board[index])
                                .font(.system(size: 40))
                                .foregroundColor(board[index] == "🐶" ? .brown : .purple)
                        }
                    }
                }
            }
        }
        .padding(20)
        
        if let winner = winner {
            Text(winner == "Draw" ? "🤝 It’s a Draw! Great job, both!" : "Winner: \(winner)")
                .font(.title2)
                .foregroundColor(.green)
        }
        
            Button("Let’s Play Again! 🔁") {
            board = Array(repeating: "", count: 9)
            isXTurn = true
            winner = nil
        
        }
        .padding()
        .background(.yellow)
        .cornerRadius(5)
    }

    func checkWinner() {
        let winPatterns = [
            [0,1,2], [3,4,5], [6,7,8],
            [0,3,6], [1,4,7], [2,5,8],
            [0,4,8], [2,4,6]
        ]

        for pattern in winPatterns {
            let first = board[pattern[0]]
            if first != "" && pattern.allSatisfy({ board[$0] == first }) {
                winner = first
                return
            }
        }

        if !board.contains("") {
            winner = "Draw"
        }
    }
}
#Preview {
    ContentView()
}


