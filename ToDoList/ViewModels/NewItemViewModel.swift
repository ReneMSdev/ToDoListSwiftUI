//
//  NewItemViewModel.swift
//  ToDoList
//
//  Created by Rene Salomone on 3/21/24.
//

import Foundation

class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    
    init() {}
    
    func save() {
        
    }
}
