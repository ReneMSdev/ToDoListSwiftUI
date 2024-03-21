//
//  Extentions.swift
//  ToDoList
//
//  Created by Rene Salomone on 3/21/24.
//

import Foundation

extension Encodable {
    // this helps func insertUserRecord() on RegisterVM insert user into firestore db
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return[:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
