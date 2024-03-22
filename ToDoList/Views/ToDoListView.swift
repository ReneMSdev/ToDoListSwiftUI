//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Rene Salomone on 3/21/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewModel()
    @FirestoreQuery var items: [ToDoListItem]
        
    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showNewItemView.toggle()
                } label: {
                    Image(systemName: "plus")
                        .bold()
                }
            }
            .sheet(isPresented: $viewModel.showNewItemView) {
                NewItemView(newItemPresented: $viewModel.showNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "6AlEERJV8BbMqHUjd4KjLk4gWN03")
}
