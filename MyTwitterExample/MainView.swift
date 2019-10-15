//
//  ContentView.swift
//  MyTwitterExample
//
//  Created by Thiago Ramos on 07/10/19.
//  Copyright © 2019 Thiago Ramos. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var bounds = UIScreen.main.bounds
    
    @ObservedObject var userState = UserState()
        
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("DisabledGray"))
                .opacity(self.userState.isMenuOpen ? 1 : 0)
                .offset(x: self.userState.isMenuOpen ? bounds.width - 60 : 0)
                .zIndex(self.userState.isMenuOpen ? 10 : -10)
                .edgesIgnoringSafeArea(.all)
                .animation(.default)
            
            TabView {
                NavigationView {
                    HomeView()
                        .navigationBarTitle(Text("Main"), displayMode: .inline)
                        .navigationBarItems(leading: UserIconView(userState: self.userState))
                }.tabItem {
                    Image("home")
                    Text("Home")
                }
                
                Text("Search")
                    .tabItem {
                        Image("search")
                        Text("Search")
                }
                
                Text("Notifications")
                    .tabItem {
                        Image("notification")
                        Text("Notification")
                }
                
                Text("Messages")
                    .tabItem {
                        Image("letter")
                        Text("Messages")
                }
            }.edgesIgnoringSafeArea(.top)
                .offset(x: self.userState.isMenuOpen ? bounds.width - 60 : 0)
                .animation(.default)
            
            MenuView(userState: userState)
                .offset(x: self.userState.isMenuOpen ? -60 : -bounds.width)
                .animation(.default)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct UserIconView: View {
    @ObservedObject var userState: UserState
    
    var body: some View {
        Button(action: {
            self.userState.isMenuOpen.toggle()
        }) {
            Image("profile1")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 30, height: 30, alignment: .center)
                .clipShape(Circle())
        }
    }
}
