//
//  MessageView.swift
//  SmartChatty
//
//  Created by Cristina on 2024-01-15.
//

import SwiftUI

struct MessageView: View {
    
    var message: Message
    
    var body: some View {
        Group {
            if message.isUser {
                HStack {
                    Spacer()
                    Text(message.content)
                        .padding(10)
                        .background(.blueBubble)
                        .foregroundColor(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                }
            } else {
                HStack {
                    Image("robotHead") // Add an avatar image here
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60) // Set the desired size for the avatar
                        .foregroundColor(.blue)
                        .padding(10)
                        .clipShape(Circle())
                    
                    Text(message.content)
                        .padding(10)
                        .background(.colorBlue)
                        .foregroundColor(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    
                    Spacer()
                }
            }
        }
    }
}



#Preview {
    MessageView(message: Message(content: "This is a preview message", isUser: false))
}
