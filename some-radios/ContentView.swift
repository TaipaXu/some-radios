//
//  ContentView.swift
//  some-radios
//
//  Created by Taipa Xu on 2023/10/4.
//

import SwiftUI

struct ContentView: View {
    @State var tabBarHeigh: CGFloat = 0;
    @EnvironmentObject var radioPlayState: RadioPlayState

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                TabView {
                    TopsView()
                        .tabItem {
                            Image(systemName: "flame")
                            Text("Tops")
                        }
                        .overlay(
                            PlayControlView()
                                .offset(x: radioPlayState.showPlayControl ? 0 : -geometry.size.width)
                                .animation(.easeInOut, value: radioPlayState.showPlayControl),
                            alignment: .bottom
                        )

                    SearchView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }

                    FavoritesView()
                        .tabItem {
                            Image(systemName: "heart")
                            Text("Favorites")
                        }
                }
                .navigationBarTitle("Some Radioss")
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(RadioPlayState())
}
