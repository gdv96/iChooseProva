//
//  PresentationUIView.swift
//  iChooseProva
//
//  Created by devannogiovanni on 15/10/21.
//

import SwiftUI

/*struct News Identifiable {
    var imageNews: String
    var testo: String
    var id = UUID()
}
var notizieComplete = [
    News(imageNews: "mensa", testo: ""),
    News(imageNews: "zanardi", testo: "")

]*/

struct PresentationUIView: View {
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
                Image("mensa")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                    
                Text("Mensa")
                
            Spacer()
        }//.edgesIgnoringSafeArea(.top)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                },
                       label: {
                                Image(systemName:"chevron.left")
                                    .font(.largeTitle)
                                    .foregroundColor(.blue)
                                Text("News")
                
                
            }
            
            
            ))
    }
}

struct PresentationUIView_Previews: PreviewProvider {
    static var previews: some View {
        PresentationUIView()
    }
}
