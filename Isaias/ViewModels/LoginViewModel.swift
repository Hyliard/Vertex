//
//  LoginViewModel.swift
//  Isaias
//
//  Created by Luis Martinez on 02/08/2025.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var loginFailed = false

    let authService = AuthService()
    var onLoginSuccess: ((User) -> Void)? // Callback para avisar de login exitoso

    func login() {
        isLoading = true
        authService.login(username: username, password: password) { user in
            DispatchQueue.main.async {
                self.isLoading = false
                if let user = user {
                    self.loginFailed = false
                    self.onLoginSuccess?(user)
                } else {
                    self.loginFailed = true
                }
            }
        }
    }
}
