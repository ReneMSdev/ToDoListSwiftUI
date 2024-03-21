//
//  RegisterViewModel.swift
//  ToDoList
//
//  Created by Rene Salomone on 3/21/24.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    private let authService: AuthenticationService
    
    init(authService: AuthenticationService = FirebaseAuthenticationService()) {
        self.authService = authService
    }
    
    func createUser() {
        guard validate() else {
            return
        }
        
        authService.createUser(name: name, email: email, password: password) { success, errorMessage in
            DispatchQueue.main.async {
                if !success {
                    print(errorMessage)
                }
            }
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
}
