//
//  LoginView.swift
//  ToDoList
//
//  Created by Rene Salomone on 3/21/24.
//

import SwiftUI

struct LoginView: View {
    //firebase auth service is default
    @StateObject var viewModel = LoginViewModel()
    // mock auth service below
    //@StateObject var viewModel = LoginViewModel(authService: MockAuthenticationService())
        
    var body: some View {
        NavigationStack {
            VStack {
                // header
                HeaderView(title: "To Do List", 
                           subtitle: "Get things done",
                           angle: -15,
                           background: .cyan)
                
                Form {
                    if  !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                        
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                                            
                    TLButton(
                        title: "Log in",
                        background: .blue
                    ) {
                        viewModel.login()
                    }
                }
                .offset(y: -50)
                .scrollContentBackground(.hidden)
                
                // create account
                VStack {
                    Text("New around here?")
                    
                    NavigationLink("Create an account", destination: RegisterView())
                }
                .padding(.top, 10)
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
