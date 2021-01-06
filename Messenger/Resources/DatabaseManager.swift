//
//  DatabaseManager.swift
//  Messenger
//
//  Created by Roger Yuen on 2021/1/6.
//

import Foundation
import Firebase

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
}

// MARK: - account management

extension DatabaseManager {
    
    func userExists(with email: String, completion: @escaping ((Bool) -> Void)) {
        
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        
        database.child(safeEmail).observeSingleEvent(of: .value) { (snapshot) in
            guard snapshot.value as? String != nil else {
                completion(false)
                return
            }
            
            completion(true)
        }
    }
    
    /// insert new user to database
    func insertUser(with user: ChatAppUser) {
        database.child(user.safeEmail).setValue([
            "first_name": user.firstname,
            "last_name": user.lastname
        ])
    }
}

struct ChatAppUser {
    let firstname: String
    let lastname: String
    let emailAddress: String
    var safeEmail: String {
        var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
    //        let profilePictureUrl: String
}
