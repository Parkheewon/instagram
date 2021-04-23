//
//  AuthManager.swift
//  Instargram
//
//  Created by kmk on 2021/04/16.
//

import FirebaseAuth

public class AuthManager {
    
    static let shared = AuthManager()
    
    // MARK : - public
    
    public func registerNewUser(username: String, email: String, password: String, complettion: @escaping (Bool) -> Void ){
        /*
            - check if user is available
            - check if email is available
            - Create account
            - Insert account to database
         */
        
        DatabaseManager.shared.cnaCreateNewUser(with: email, username: username) { (canCreate) in
            if canCreate {
                /*
                 - Create account
                 - Insert account to database
                */
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    guard error == nil, result != nil else {
                        complettion(false)
                        return
                    }
                    
                    // Insert into databse
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { (inserted) in
                        if inserted {
                            complettion(true)
                            return
                        }else {
                            // failed to insert to database
                            complettion(false)
                            return
                        }
                    }
                    
                }
            }else {
                //eiter username or email does not exit
                complettion(false)
                
            }
        }
        
        
    }
    
    public func loginUser(username: String?, email: String?, password:String, complete: @escaping (Bool) -> Void) {
        if let email = email {
            //email log in
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                guard authResult != nil, error == nil else {
                    complete(false)
                    return
                }
                complete(true)
            }
            
        }
        else if let username = username {
            // username log in
            print(username)
            
            
        }
        
    }
    
}
