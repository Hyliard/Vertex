//
//  ProfileView.swift
//  Isaias
//
//  Created by Luis Martinez on 02/08/2025.
//

import SwiftUI

struct ProfileView: View {
    // Demo: datos de usuario simulados
    @State private var username: String = "Luis Gerardo"
    @State private var email: String = "gerard@email.com"
    @State private var stepsToday: Int = 5400
    @State private var isEditing: Bool = false

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // AVATAR
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .foregroundStyle(.blue.gradient)
                    .padding(.top, 32)
                
                // NOMBRE Y EMAIL
                VStack(spacing: 4) {
                    Text(username)
                        .font(.title.bold())
                        .foregroundStyle(.primary)
                    Text(email)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

                // ESTADÍSTICAS O INFO
                HStack(spacing: 40) {
                    VStack {
                        Text("\(stepsToday)")
                            .font(.title2.bold())
                            .foregroundStyle(.green)
                        Text("Pasos hoy")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    VStack {
                        Text("Activo")
                            .font(.title2.bold())
                            .foregroundStyle(.blue)
                        Text("Estado")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
                .padding()
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                // BOTONES DE ACCIÓN
                VStack(spacing: 12) {
                    Button("Editar perfil") {
                        isEditing = true
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button(role: .destructive) {
                        // Acción de cerrar sesión
                    } label: {
                        Label("Cerrar sesión", systemImage: "rectangle.portrait.and.arrow.right")
                    }
                    .buttonStyle(.bordered)
                }
                .padding(.bottom, 40)
            }
            .frame(maxWidth: 400)
            .padding()
        }
        // Puedes agregar un sheet para editar el perfil si quieres
        .sheet(isPresented: $isEditing) {
            EditProfileView(username: $username, email: $email)
        }
    }
}

// Vista básica para editar datos (opcional)
struct EditProfileView: View {
    @Binding var username: String
    @Binding var email: String
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            Form {
                TextField("Nombre", text: $username)
                TextField("Email", text: $email)
            }
            .navigationTitle("Editar perfil")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("OK") { dismiss() }
                }
            }
        }
    }
}


