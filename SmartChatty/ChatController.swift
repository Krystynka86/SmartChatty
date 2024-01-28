//
//  ChatController.swift
//  SmartChatty
//
//  Created by Cristina on 2024-01-15.
//

import Foundation
import OpenAI

class ChatController: ObservableObject {
    
    @Published var messages: [Message] = [.init(content: "Hi! I'm SmartChatty, your friendly chatbot. How can I help you today?", isUser: false)]
    
    
    let openAI = OpenAI(apiToken: Config.openAPIToken)
    
    
    func sendNewMessage(content: String) {
        let userMessage = Message(content: content, isUser: true)
        self.messages.append(userMessage)
        getBotReply()
        
    }
    
    func getBotReply() {
        let personality = [Chat(role: .user , content: "You must respond to everything in simple english")]
        
        openAI.chats(query: .init(model: .gpt3_5Turbo, messages:  personality + self.messages.map({ Chat(role: .user, content: $0.content)}))) { result in
            
            DispatchQueue.main.async {
                            
                            switch result {
                            case .success(let success):
                                guard let choice = success.choices.first else {
                                    return
                                }
                                let message = choice.message.content
                                self.messages.append(Message(content: message ?? "", isUser: false))
                                
                            case .failure(let failure):
                                print(failure)
                            }
                        }
                    }
                }
            }

