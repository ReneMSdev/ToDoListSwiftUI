//
//  LoginViewModel.swift
//  ToDoList
//
//  Created by Rene Salomone on 3/21/24.
//

import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    private let authService: AuthenticationService
    
    init(authService: AuthenticationService = FirebaseAuthenticationService()) {
        self.authService = authService
    }
    
    func login() {
        guard validate() else {
            return
        }
        
        // log in with firebase
        
    }
    
    func validate() -> Bool {
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "* Please fill in all fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "* Please enter valid email."
            return false
        }
        
        return true
    }
}
