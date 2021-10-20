//
//  TabUIView.swift
//  iChooseProva
//
//  Created by devannogiovanni on 13/10/21.
//

import SwiftUI

struct TabUIView: View {
    
    var body: some View {
        TabView {
            /*if user.isLoggedIn {
                homeNonUtenteUIView()
            } else {
                homeUtenteUIView()
            }*/
            Text("User tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem{
                    Image(systemName: "person")
                    Text("User")
                }
            PollsUIView()
                .tabItem{
                    Image(systemName: "star")
                    Text("Polls")
                }
            
            NewsUIView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("News")
                }
                    }
    }
    
}

struct TabUIView_Previews: PreviewProvider {
    static var previews: some View {
        TabUIView()
    }
}
