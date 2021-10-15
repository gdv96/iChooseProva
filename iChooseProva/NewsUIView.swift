//
//  NewsUIView.swift
//  iChooseProva
//
//  Created by devannogiovanni on 13/10/21.
//

import SwiftUI

struct cardNews: Identifiable{
    var title: String
    var subTitle: String
    var author: String
    var imageName: String
    var id = UUID()
}

var cardsNews = [
    cardNews(title: "20/07/2021", subTitle: "Mensa anno scolastico 2021/2022, domani al via le iscrizioni al servizio", author: "Domani al via le iscrizioni online al servizio mensa per l’anno scolastico 2021/2022. ", imageName: "mensa"),
    cardNews(title: "19/07/21", subTitle: "Il 20 luglio farà tappa a Benevento la staffetta “Obiettivo Tricolore” promossa da Alex Zanardi", author: "Domani (20 luglio) farà tappa a Benevento la staffetta “Obiettivo Tricolore”", imageName: "zanardi")
    
]

struct NewsUIView: View {
    
    /*init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemRed, .font: UIFont(name: "ArialRoundedMTBold", size: 35)!]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.systemRed, .
        font: UIFont(name: "ArialRoundedMTBold", size: 20)!]
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance

        navBarAppearance.setBackIndicatorImage(UIImage(systemName: "arrow.turn.up.left"),
        transitionMaskImage: UIImage(systemName: "arrow.turn.up.left"))

        UINavigationBar.appearance().tintColor = .black
    }*/
    
    var body: some View {
        
            NavigationView{
                //VStack{
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        Group{
                            ForEach(cardsNews) { cardsnews in
                                /*NavigationLink(destination: DetailUIView(news: news)) {
                                    CardView(news: news)
                                }*/
                                ZStack {
                                    //CardView(news: news)
                                   NavigationLink(destination:
                                   PresentationUIView()) {
                                        EmptyView()
                                        CardView(cardsnews: cardsnews)
                                    }
                                    
                                }
                            }
                        }.frame(width: 350)
                            .minimumScaleFactor(0.5)
                    }
                    Spacer()
                }.navigationBarTitle("Notizie", displayMode:.automatic)
            
            }
    }
}

struct NewsUIView_Previews: PreviewProvider {
    static var previews: some View {
        NewsUIView()
    }
}

struct CardView: View {
    
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
                Text(cardsnews.subTitle)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .lineLimit(3)
                Text(cardsnews.author)
                    .font(.caption)
                    .foregroundColor(.secondary)
               
            }
            Spacer()
        }.padding()
                
            }.cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 5))
            .padding([.top, .vertical ])
    }
}

