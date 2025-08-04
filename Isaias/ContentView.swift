//
//  ContentView.swift
//  Isaias
//
//  Created by Luis Martinez on 31/07/2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionViewModel

    var body: some View {
        if let _ = session.currentUser {
            DashboardView()
        } else {
            let loginVM = LoginViewModel()
            LoginView(viewModel: loginVM)
                .onAppear {
                    loginVM.onLoginSuccess = { user in
                        session.currentUser = user
                    }
                }
        }
    }
}
