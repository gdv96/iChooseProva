//
//  DetailNewsUIView.swift
//  iChooseProva
//
//  Created by devannogiovanni on 20/10/21.
//

import SwiftUI

struct DetailNewsUIView: View {
    var news: cardNews
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                Image(news.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                    .padding()
                Text(news.subTitle)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .padding()
                Text(news.testo)
                    .padding()
                Spacer()
                
            }
            
        }
        
    }
}

struct DetailNewsUIView_Previews: PreviewProvider {
    static var previews: some View {
        DetailNewsUIView(news: cardNews(title: "prova", subTitle: "prova prova prova", author: "prova", imageName: "mensa", testo: ""))
    }
}
