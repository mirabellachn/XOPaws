//
//  SplashScreen.swift
//  XOPaws
//
//  Created by Mirabella on 16/04/25.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var fadeIn = false
    
    var body: some View {
        if isActive {
            SplashScreen()
        } else {
            ZStack {
                Color(.systemBackground)
                     .ignoresSafeArea()
                
                VStack(spacing: 12) {
                    Text("XOpaws🐾")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)
                        .kerning(1)
                    
                    Text("The Most Pawful Tic-Tac-Toe Game")
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundColor(.secondary)
                        .italic()
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)
                }
                .opacity(fadeIn ? 1 : 0)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.0)) {
                        fadeIn = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
