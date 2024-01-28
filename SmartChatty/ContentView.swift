//
//  ContentView.swift
//  SmartChatty
//
//  Created by Cristina on 2024-01-13.
//

import SwiftUI
import ConfettiSwiftUI

struct ContentView: View {
    
    @StateObject var chatController: ChatController = .init()
    @State var string: String = ""
    @State private var counter = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    ForEach(chatController.messages) {
                        message in
                        MessageView(message: message)
                            .padding(5)
                    }
                }
                Divider()
                HStack {
                    TextField("Send a message...", text: self.$string, axis: .vertical)
                        .padding(10)
                        .background(Color.gray.opacity(0.1))
                        .textFieldStyle(.automatic)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    Button {
                        self.chatController.sendNewMessage(content: string)
                        string = ""
                        counter += 1
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.blueShade)
                    }
                    .confettiCannon(counter: $counter, colors: [.blueBubble, .blueShade])
                }
                .padding()
                
            }
            .navigationBarTitle("SmartChatty")
            .navigationBarTitleDisplayMode(.inline)
            .padding()
        }
        .preferredColorScheme(.dark)
        
    }
    
}

#Preview {
    ContentView()
}
