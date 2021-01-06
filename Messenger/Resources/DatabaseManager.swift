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
        database.child(email).observeSingleEvent(of: .value) { (snapshot) in
            guard snapshot.value as? String != nil else {
                completion(false)
                return
            }
            
            completion(true)
        }
    }
    
    /// insert new user to database
    func insertUser(with user: ChatAppUser) {
        database.child(user.emailAddress).setValue([
            "first_name": user.firstname,
            "last_name": user.lastname
        ])
    }
}

struct ChatAppUser {
    let firstname: String
    let lastname: String
    let emailAddress: String
    //        let profilePictureUrl: String
}
