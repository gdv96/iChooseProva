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
    var testo: String
    var id = UUID()
}

var cardsNews = [
    cardNews(title: "20/07/2021", subTitle: "Mensa anno scolastico 2021/2022, domani al via le iscrizioni al servizio", author: "Domani al via le iscrizioni online al servizio mensa per l’anno scolastico 2021/2022.", imageName: "mensa", testo:"Domani al via le iscrizioni online al servizio mensa per l’anno scolastico 2021/2022. A renderlo noto è l’assessora all’Istruzione, Rossella Del Prete. A tal proposito l’assessora ricorda che, di recente, la Giunta Comunale ha deliberato l’attivazione delle 'Misure di solidarietà alimentare a favore dei nuclei familiari con figli fruitori del servizio di refezione scolastica'.Pertanto, sino alla soglia ISEE di € 21.000,00 è prevista la contribuzione pari al 100% della tariffa. Oltre la soglia ISEE di € 21.000,00 è prevista la contribuzione pari al 70% della tariffa. I non residenti non potranno ovviamente beneficiare delle suddette contribuzioni."),
    cardNews(title: "19/07/21", subTitle: "Il 20 luglio farà tappa a Benevento la staffetta “Obiettivo Tricolore” promossa da Alex Zanardi", author: "Domani (20 luglio) farà tappa a Benevento la staffetta “Obiettivo Tricolore”", imageName: "zanardi", testo: "Domani (20 luglio) farà tappa a Benevento la staffetta “Obiettivo Tricolore”, manifestazione che nasce dal progetto di Alex Zanardi di portare in giro per l’Italia un messaggio di speranza, forza e resilienza. Lo rendono noto il sindaco Clemente Mastella e il consigliere delegato allo Sport, Enzo Lauro.")
    
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
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                       Group{
                            ForEach(cardsNews) {cardsnews in
                                NavigationLink(destination: DetailView(titleDetail: cardsnews.subTitle, testoCompleto: cardsnews.testo, imageDetail: cardsnews.imageName)) {
                                    CardView(cardsnews: cardsnews)
                                }
                            
                                /*NavigationLink(destination: DetailUIView(news: news)) {
                                    CardView(news: news)
                                }*/
                                /*ZStack{
                                   CardView(cardsnews: cardsnews)
                                   NavigationLink(destination:
                                   PresentationUIView()) {
                                        //CardView(cardsnews: cardsnews)
                                        EmptyView()
                                       
                                   }
                                }*/
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

struct DetailView: View {
    var titleDetail: String
    var testoCompleto: String
    var imageDetail: String
    //var cardsnews: cardNews
    var body: some View {
        //Text(cardsnews.testo)
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                Image(imageDetail)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                    .padding()
                Text(titleDetail)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .padding()
                Text(testoCompleto)
                    .padding()
                Spacer()
                
            }
            
        }
        
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

