//
//  DashboardView.swift
//  Isaias
//
//  Created by Luis Martinez on 02/08/2025.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var session: SessionViewModel
    
    var body: some View {
        TabView {
            HomeTabView()
                .tabItem {
                    Label("Inicio", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Perfil", systemImage: "person")
                }
            SettingsView()
                .tabItem {
                    Label("Config", systemImage: "gear")
                }
        }
    }
}

// Pestaña de Inicio con ejemplo de bienvenida y cards
struct HomeTabView: View {
    // Demo: podrías traer el nombre de session después
    let username = "Gerard"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Saludo
                    HStack {
                        Text("¡Hola, \(username)!")
                            .font(.largeTitle.bold())
                            .foregroundStyle(.blue)
                        Spacer()
                    }
                    .padding(.top, 16)
                    
                    // Ejemplo de tarjeta (puedes hacerlas dinámicas luego)
                    CardView(title: "¿Sabías?", subtitle: "Puedes editar tu perfil desde la pestaña Perfil.")
                    
                    CardView(title: "Tip del día", subtitle: "Toca el ícono de engranaje para acceder a la configuración.")
                    
                    // Botón de acción demo
                    Button(action: {
                        // Aquí podrías agregar lógica después
                    }) {
                        Label("Agregar algo", systemImage: "plus.circle.fill")
                            .font(.title3.bold())
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            }
            .navigationTitle("Inicio")
        }
    }
}

// CardView: simple, reusable
struct CardView: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.headline)
            Text(subtitle)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .shadow(radius: 2)
    }
}



