//
//  HomeView.swift
//  SmartChatty
//
//  Created by Cristina on 2024-01-18.
//

import SwiftUI

struct HomeView: View {
    @State private var isChatActive = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Welcome to SmartChatty!")
                    .font(.title)
                    .bold()
                    .padding()
                
                Spacer()
                
                Image("robotCrop")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Spacer()
                
                Text("Start chatting with SmartChatty now.\nYou can ask me anything")
                    .font(.subheadline)
                    .padding()
                    .multilineTextAlignment(.center)
                
                Spacer()
                
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
