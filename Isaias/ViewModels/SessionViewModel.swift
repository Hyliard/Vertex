//
//  SessionViewModel.swift
//  Isaias
//
//  Created by Luis Martinez on 02/08/2025.
//

import Foundation

class SessionViewModel: ObservableObject {
    @Published var currentUser: User? = nil

    func logout() {
        currentUser = nil
    }
}
