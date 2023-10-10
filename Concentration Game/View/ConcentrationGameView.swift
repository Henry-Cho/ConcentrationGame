//
//  ConcentrationGameView.swift
//  Concentration Game
//
//  Created by Henry Cho on 10/9/23.
//

import SwiftUI

struct ConcentrationGameView: View {
    let emojiGame: EmojiConcentrationGame
    var body: some View {
        GeometryReader { geometry in
            VStack {
                LazyVGrid(columns: columns(for: geometry.size))
                {
                    ForEach(emojiGame.dealtCards) { card in
                        CardView(card: card)
                            .transition(AnyTransition.offset(randomOffscreenLocation))
                            .onTapGesture {
                                emojiGame.choose(card)
                            }
                    }
                }
                Spacer()
                HStack {
                    Button("New Game") {
                        emojiGame.newGame()
                    }
                    Spacer()
                    Text("Score:  \(emojiGame.score)")
                }
            }
            .padding()
        }
        .onAppear {
            emojiGame.dealCards()
        }
    }
    
    private var randomOffscreenLocation: CGSize {
        let radius = max(UIScreen.main.bounds.width, UIScreen.main.bounds.height) * 1.5
        let factor: Double = Int.random(in: 0...1) > 0 ? 1 : -1
        return CGSize(width: factor * radius, height: factor * radius)
        
    }
    
    // MARK: - Drawing constants
    private struct Game {
        static let desiredCardWith = 125.0
    }
    
    private func columns(for size: CGSize) -> [GridItem] {
        Array(repeating: GridItem(.flexible()), count: Int(size.width / Game.desiredCardWith))
    }
}

#Preview {
    ConcentrationGameView(emojiGame: EmojiConcentrationGame())
}
