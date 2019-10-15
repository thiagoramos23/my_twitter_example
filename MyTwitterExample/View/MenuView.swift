//
//  MenuView.swift
//  MyTwitterExample
//
//  Created by Thiago Ramos on 13/10/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var userState: UserState
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                HeaderMenu()
            }
            .padding(.bottom, 30)
            VStack(alignment: .leading) {
                MenuItem(userState: userState)
                MenuItem(imageName: "text.justifyright", itemName: "Listas", userState: userState)
                MenuItem(imageName: "bookmark", itemName: "Itens Salvos", userState: userState)
                MenuItem(imageName: "bolt", itemName: "Moments", userState: userState)
            }
            Spacer()
        }
        .padding(.leading, 60)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(userState: UserState())
    }
}

struct HeaderMenu: View {
    var body: some View {
        VStack(alignment: .leading) {
            CircleProfileImageView(profileImage: Image("profile1"), width: 60, height: 60)
            Text("Carla Ramos")
                .font(Font.system(size: 20))
                .fontWeight(.black)
            Text("@carlinha")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack {
                Text("826").font(.headline)
                Text("Seguindo")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("304").font(.headline)
                Text("Seguidores")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.top, 0)
        }
    }
}

struct MenuItem: View {
    var imageName: String = "person"
    var itemName: String = "Perfil"
    
    @ObservedObject var userState: UserState
    
    var body: some View {
        HStack {
            Button(action: {
                self.userState.isMenuOpen.toggle()
            }) {
                HStack {
                    Image(systemName: self.imageName)
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .topLeading)
                        .foregroundColor(.gray)
                    
                    Text(self.itemName)
                        .font(Font.system(size: 20))
                        .fontWeight(.light)
                        .padding(.leading, 10)
                }
                .foregroundColor(.black)
            }
        }
        .padding(.top, 25)
    }
}
