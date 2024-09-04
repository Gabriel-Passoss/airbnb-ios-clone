//
//  ProfileView.swift
//  AirbnbClone
//
//  Created by Gabriel dos Passos on 04/09/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Profile")
                        .font(.title)
                    .fontWeight(.semibold)
                    
                    Text("Log in to start planning your next trip")
                }
                
                Button(action: {
                }, label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                })
                
                HStack {
                    Text("Don't have an account?")
                    
                    Text("Sign up")
                        .fontWeight(.semibold)
                        .underline()
                }
                .font(.footnote)
            }
            
            VStack(spacing: 24) {
                ProfileRowOptionView(imageName: "gear", title: "Settings")
                
                ProfileRowOptionView(imageName: "gear", title: "Accessibility")
                
                ProfileRowOptionView(imageName: "questionmark.circle", title: "Visit the help center")
            }
            .padding(.vertical)
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}

struct ProfileRowOptionView: View {
    let imageName: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
            
            Text(title)
                .font(.subheadline)
            
            Spacer()
            
            Image(systemName: "chevron.right")
        }
    }
}
