//
//  CardViewNews.swift
//  iChooseProva
//
//  Created by devannogiovanni on 20/10/21.
//

import SwiftUI

struct CardViewNews: View {
    var cardsnews: cardNews
    var body: some View {
    
        VStack{
            Image(cardsnews.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
        HStack{
            VStack(alignment: .leading){
                Text(cardsnews.title)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                Text(cardsnews.subTitle)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                Text(cardsnews.author)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                
            }
            Spacer()
        }.padding()
                
            }.cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 5))
            .padding([.top, .vertical ])
    }
}

struct CardViewNews_Previews: PreviewProvider {
    static var previews: some View {
        CardViewNews(cardsnews: cardNews(title: "Prova", subTitle: "Prova prova prova", author: "Prova", imageName: "mensa", testo: ""))
    }
}
