//
//  MockAuthenticationService.swift
//  ToDoList
//
//  Created by Rene Salomone on 3/21/24.
//

import Foundation

class MockAuthenticationService: AuthenticationService {
    func createUser(name: String, email: String, password: String, completion: @escaping (Bool, String) -> Void) {
        completion(true, "")
    }
    
    func signIn(withEmail email: String, password: String, completion: @escaping (Bool, String) -> Void) {
        if email == "test@test.com" && password == "password" {
            completion(true, "")
        } else {
            completion(false, "Invalid credentials")
        }
    }
}
