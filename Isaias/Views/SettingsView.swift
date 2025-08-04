//
//  SettingsView.swift
//  Isaias
//
//  Created by Luis Martinez on 02/08/2025.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var session: SessionViewModel
    @State private var showDeleteAlert = false
    @State private var showAbout = false
    @State private var showHelp = false
    @State private var showTerms = false
    @State private var showCookies = false
    @State private var showUISettings = false
    @State private var showSecurity = false

    var body: some View {
        NavigationView {
            Form {
                // Sección de cuenta
                Section(header: Text("Cuenta")) {
                    Button("Cerrar sesión", role: .destructive) {
                        session.logout()
                    }
                    Button("Eliminar cuenta", role: .destructive) {
                        showDeleteAlert = true
                    }
                }
                
                // Sección de información
                Section(header: Text("Información")) {
                    Button("Sobre la app") {
                        showAbout = true
                    }
                    Button("Términos y Políticas") {
                        showTerms = true
                    }
                    Button("Cookies") {
                        showCookies = true
                    }
                }
                
                // Sección de ayuda
                Section(header: Text("Ayuda")) {
                    Button("Ayuda / Soporte") {
                        showHelp = true
                    }
                }
                
                // Sección de personalización/interfaz
                Section(header: Text("Interfaz de usuario")) {
                    Button("Preferencias de interfaz") {
                        showUISettings = true
                    }
                }
                
                // Sección de seguridad
                Section(header: Text("Seguridad")) {
                    Button("Configuración de seguridad") {
                        showSecurity = true
                    }
                }
                
                // Puedes agregar más secciones aquí según tus necesidades
            }
            .navigationTitle("Configuración")
            .alert("¿Eliminar cuenta?", isPresented: $showDeleteAlert) {
                Button("Cancelar", role: .cancel) { }
                Button("Eliminar", role: .destructive) {
                    // Lógica para eliminar la cuenta aquí
                }
            } message: {
                Text("Esta acción es irreversible. ¿Seguro que deseas continuar?")
            }
            // Sheets de ejemplo (puedes reemplazar por vistas reales después)
            .sheet(isPresented: $showAbout) {
                AboutView()
            }
            .sheet(isPresented: $showHelp) {
                HelpView()
            }
            .sheet(isPresented: $showTerms) {
                TermsView()
            }
            .sheet(isPresented: $showCookies) {
                CookiesView()
            }
            .sheet(isPresented: $showUISettings) {
                UISettingsView()
            }
            .sheet(isPresented: $showSecurity) {
                SecuritySettingsView()
            }
        }
    }
}

// Vistas dummy para los sheets (puedes tunearlas o reemplazar)
struct AboutView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Acerca de la app")
                .font(.title)
            Text("Versión 1.0.0\nDesarrollada por Gerard y Codey")
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding()
    }
}

struct HelpView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Ayuda y Soporte")
                .font(.title)
            Text("¿Necesitas ayuda? Escribe a soporte@app.com")
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding()
    }
}

struct TermsView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Términos y Políticas")
                .font(.title)
            Text("Aquí puedes mostrar los términos de uso y la política de privacidad.")
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding()
    }
}

struct CookiesView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Política de Cookies")
                .font(.title)
            Text("Información sobre el uso de cookies en la app.")
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding()
    }
}

struct UISettingsView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Preferencias de Interfaz")
                .font(.title)
            Text("Aquí puedes agregar opciones como modo oscuro, tamaño de letra, etc.")
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding()
    }
}

struct SecuritySettingsView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Configuración de Seguridad")
                .font(.title)
            Text("Opciones de autenticación, 2FA, o cambio de contraseña.")
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding()
    }
}

