//
//  ProfileView.swift
//  ToDoList
//
//  Created by Rene Salomone on 3/21/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    init() {}
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 50) {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile ...")
                }
            }
            .navigationTitle("Profile")
            .padding(.horizontal)
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
            // avatar
            HStack {
                Spacer()
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(Color.blue)
                    .frame(width: 125, height: 125)
                    .padding(.top, 30)
                Spacer()
            }
            // info: Name, Email, Member since
            VStack(alignment: .leading, spacing: 30) {
                HStack {
                    Text("Name: ")
                        .bold()
                    Text(user.name)
                }
                
                HStack {
                    Text("Email: ")
                        .bold()
                    Text(user.email)
                }
                
                HStack {
                    Text("Member since: ")
                        .bold()
                    Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                }
            }
            .padding(.leading)
            
            // log out
            TLButton(title: "Log Out",
                     background: .red) {
                viewModel.logOut()
            }
            
            Spacer()
    }
}

#Preview {
    ProfileView()
}
