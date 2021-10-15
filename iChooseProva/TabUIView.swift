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
            
            Text("Profilo tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem{
                    Image(systemName: "person")
                    Text("Profilo")
                }
            Text("Proposte Tab")
                .font(.system(size:30, weight: .bold, design: .rounded))
                .tabItem{
                    Image(systemName: "star")
                    Text("Proposte")
                }
            
            NewsUIView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Notizie")
                }
                    }
    }
    
}

struct TabUIView_Previews: PreviewProvider {
    static var previews: some View {
        TabUIView()
    }
}
