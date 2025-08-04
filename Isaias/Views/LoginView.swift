//
//  LoginView.swift
//  Isaias
//
//  Created by Luis Martinez on 02/08/2025.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("Iniciar Sesión")
                .font(.largeTitle).bold()
            TextField("Usuario", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
            SecureField("Contraseña", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            if viewModel.isLoading {
                ProgressView()
            }

            Button("Ingresar") {
                viewModel.login()
            }
            .disabled(viewModel.username.isEmpty || viewModel.password.isEmpty)

            if viewModel.loginFailed {
                Text("Usuario o contraseña incorrectos")
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

