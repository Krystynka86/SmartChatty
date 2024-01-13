//
//  ContentView.swift
//  SmartChatty
//
//  Created by Cristina on 2024-01-13.
//

import SwiftUI

class ChatController: ObservableObject {
    @Published var messages: [Message] = [.init(content: "Hello", isUser: true), .init(content: "Hello", isUser: false)]
}

struct Message: Identifiable {
    var id: UUID = .init()
    var content: String
    var isUser: Bool
}

struct ContentView: View {
    
    @StateObject var chatController: ChatController = .init()
    @State var string: String = ""
    
    var body: some View {
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
                TextField("Message...", text: self.$string, axis: .vertical)
                    .padding(5)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                }
            }
            .padding()
        }
    }
}

struct MessageView: View {
    
    var message: Message
    
    var body: some View {
        Group {
            if message.isUser {
                HStack {
                    Spacer()
                    Text(message.content)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .clipShape(Capsule())
                }
            } else {
                HStack {
                    Text(message.content)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .clipShape(Capsule())
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
