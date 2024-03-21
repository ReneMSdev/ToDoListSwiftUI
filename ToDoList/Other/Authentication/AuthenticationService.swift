//
//  AuthenticationService.swift
//  ToDoList
//
//  Created by Rene Salomone on 3/21/24.
//

import Foundation

protocol AuthenticationService {
    func signIn(withEmail 
                email: String,
                password: String,
                completion: @escaping (Bool, String) -> Void)
    
    func createUser(
        name: String,
        email: String,
        password: String,
        completion: @escaping (Bool, String) -> Void)
}

