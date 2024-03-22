//
//  FirebaseAuthenticationService.swift
//  ToDoList
//
//  Created by Rene Salomone on 3/21/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class FirebaseAuthenticationService: AuthenticationService {

    func createUser(name: String, email: String, password: String, completion: @escaping (Bool, String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard let userId = result?.user.uid, error == nil else {
                completion(false, error?.localizedDescription ?? "An unknown error occurred")
                return
            }
            
            // creates new user an adds to firestore db
            let newUser = User(id: userId, name: name, email: email, joined: Date().timeIntervalSince1970)
            let db = Firestore.firestore()
            db.collection("users").document(userId).setData(newUser.asDictionary()) { error in
                if let error = error {
                    completion(false, error.localizedDescription)
                } else {
                    completion(true, "")
                }
            }
        }
    }
    
    func signIn(withEmail email: String, password: String, completion: @escaping (Bool, String) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                completion(false, error.localizedDescription)
            } else {
                completion(true, "")
            }
        }
    }
}
