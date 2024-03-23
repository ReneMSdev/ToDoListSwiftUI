//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Rene Salomone on 3/21/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItem]
        
    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions() {
                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                                Label("Delete", systemImage: "trash")
                                    .tint(.red)
                            }
                        }
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

