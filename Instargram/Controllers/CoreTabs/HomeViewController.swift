//
//  ViewController.swift
//  Instargram
//
//  Created by kmk on 2021/04/15.
//
import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            
        handleNotAuthenticated()
        
//        do {
//            try FirebaseAuth.Auth.auth().signOut()
//        }
//        catch{
//            print("filed to sing out")
//        }
//
    }
    
    private func handleNotAuthenticated(){
        
        if Auth.auth().currentUser == nil {
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false, completion: nil)
        }
        
    }

}

