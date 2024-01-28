//
//  HomeView.swift
//  SmartChatty
//
//  Created by Cristina on 2024-01-18.
//

import SwiftUI
import EffectsLibrary


struct HomeView: View {
    @State private var isChatActive = false
    var config = RainConfig(
        intensity: .low,
        lifetime: .long,
        initialVelocity: .fast,
        fadeOut: .slow,
        spreadRadius: .high
    )

    var body: some View {
        NavigationView {
            ZStack {
                RainView(config: config)
                VStack {
                    
                    Text("Welcome to SmartChatty!")
                        .font(.title)
                        .bold()
                        .padding()
                    
                    Text("Start chatting with SmartChatty now.\nYou can ask me anything")
                        .font(.subheadline)
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    Image("robotCrop")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    
                    
                    Button(action: {
                        self.isChatActive = true
                        
                    }) {
                        
                        Text("Start Chat")
                            .padding()
                            .foregroundColor(.white)
                            .background(.colorBlue)
                            .cornerRadius(10)
                    }
                    .shadow(color: .blueShade, radius: 15, y: 5)
                    .padding(.bottom, 65)
                    
                    Spacer()
                }
                
                
                    NavigationLink(
                        destination: ContentView(),
                        isActive: $isChatActive
                    ) {
                        ContentView()
                    }
                    .hidden()
            }
        }
        .preferredColorScheme(.dark)
    }
}


#Preview {
    HomeView()
}
