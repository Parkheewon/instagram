//
//  DatabaseManager.swift
//  Instargram
//
//  Created by kmk on 2021/04/16.
//

import FirebaseDatabase

public class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    // MARK : - public
    
    
    //Check username and email is available
    // -parameters
    //     - email : String representing email
    //     - username : String representing username
    public func cnaCreateNewUser(with email : String, username: String, completeion: (Bool) -> Void){
        completeion(true)
    }
    
    //insert new user data to database
    // -parameters
    //     - email : String representing email
    //     - username : String representing username
    //     - completion : Async callback for result if database entry succeded
    public func insertNewUser(with email: String, username: String, completion: @escaping(Bool) -> Void){
        let key = email.safeDatabaseKey()
    
        database.child(key).setValue(["username": username]) { (error, _) in
            if error == nil {
                // successed
                completion(true)
                return
            }else {
                //failed
                completion(false)
                return
            }
        }
    }
    
    
}


