//
//  ProfileView.swift
//  ToDoList
//
//  Created by Rene Salomone on 3/21/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    init() {
        
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
