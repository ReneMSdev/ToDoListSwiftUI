//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by Rene Salomone on 3/21/24.
//

import Foundation

// ViewModel for list of items view
// Primary tab
class ToDoListViewModel: ObservableObject {
    @Published var showNewItemView = false
    
    init() {}
}
