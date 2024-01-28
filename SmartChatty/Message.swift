//
//  Message.swift
//  SmartChatty
//
//  Created by Cristina on 2024-01-15.
//

import Foundation

struct Message: Identifiable {
    var id: UUID = .init()
    var content: String
    var isUser: Bool
}
