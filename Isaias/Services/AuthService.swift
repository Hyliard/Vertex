//
//  AuthService.swift
//  Isaias
//
//  Created by Luis Martinez on 02/08/2025.
//

import Foundation

class AuthService {
    // Simula un login asíncrono con usuario "test" y pass "test"
    func login(username: String, password: String, completion: @escaping (User?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if username == "test" && password == "test" {
                let user = User(id: UUID().uuidString, username: "test", email: "test@mail.com")
                completion(user)
            } else {
                completion(nil)
            }
        }
    }

    func logout() {
        // Aquí iría la lógica de cerrar sesión si hubiera una API o token, por ahora nada.
    }
}
