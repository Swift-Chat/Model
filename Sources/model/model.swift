import Foundation

public struct User: Codable, Hashable {
    public init(username: String) {
        self.username = username
    }

    public var username: String
}

public struct Message: Codable, Hashable {
    public init(id: Int, content: String, sender: User, receiver: User) {
        self.id = id
        self.content = content
        self.sender = sender
        self.receiver = receiver
    }

    public var id: Int
    public var content: String
    public var sender: User
    public var receiver: User
}

public struct MessageInput: Codable {
    public init(content: String, sender: User, receiver: User) {
        self.content = content
        self.sender = sender
        self.receiver = receiver
    }

    public var content: String
    public var sender: User
    public var receiver: User
}

public struct Token: Codable {
    public init(value: String, user: User) {
        self.value = value
        self.user = user
    }
    
    public var value: String
    public var user: User
}

public struct Conversation: Codable, Hashable {
    public static func == (lhs: Conversation, rhs: Conversation) -> Bool {
        return ((lhs.user.username == rhs.user.username) && (lhs.messages.count == rhs.messages.count))
    }
    
    public init(messages: [Message], user: User) {
        self.user = user
        self.messages = messages
    }
    
    public var user: User
    public var messages: [Message]
}
