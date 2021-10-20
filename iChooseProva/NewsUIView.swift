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
    cardNews(title:"01/10/21", subTitle:"Nuovo ponte sul torrente Epitaffio,a breve l’appalto per l’assegnazione dei lavori", author:"", imageName:"ponteepitaffio", testo: "L’Ufficio Espropri, con riferimento ai lavori di realizzazione del nuovo ponte sul torrente Epitaffio (che collega la via Appia con la chiesa di S. Anna), rende noto che lo scorso 23 settembre sono state avviate le azioni di presa di possesso dei terreni e che le suddette azioni si concluderanno la prossima settimana.Esaurita tale fase, quindi, si procederà all’appalto per l’assegnazione dei lavori e all’esecuzione degli stessi, che si concluderanno nel giro di quattro/cinque mesi."),
    cardNews(title: "20/07/2021", subTitle: "Mensa anno scolastico 2021/2022, domani al via le iscrizioni al servizio", author: "Domani al via le iscrizioni online al servizio mensa per l’anno scolastico 2021/2022.", imageName: "mensa", testo:"Domani al via le iscrizioni online al servizio mensa per l’anno scolastico 2021/2022. A renderlo noto è l’assessora all’Istruzione, Rossella Del Prete. A tal proposito l’assessora ricorda che, di recente, la Giunta Comunale ha deliberato l’attivazione delle 'Misure di solidarietà alimentare a favore dei nuclei familiari con figli fruitori del servizio di refezione scolastica'.Pertanto, sino alla soglia ISEE di € 21.000,00 è prevista la contribuzione pari al 100% della tariffa. Oltre la soglia ISEE di € 21.000,00 è prevista la contribuzione pari al 70% della tariffa. I non residenti non potranno ovviamente beneficiare delle suddette contribuzioni."),
    cardNews(title: "19/07/21", subTitle: "Il 20 luglio farà tappa a Benevento la staffetta “Obiettivo Tricolore” promossa da Alex Zanardi", author: "Domani (20 luglio) farà tappa a Benevento la staffetta “Obiettivo Tricolore”", imageName: "zanardi", testo: "Domani (20 luglio) farà tappa a Benevento la staffetta “Obiettivo Tricolore”, manifestazione che nasce dal progetto di Alex Zanardi di portare in giro per l’Italia un messaggio di speranza, forza e resilienza. Lo rendono noto il sindaco Clemente Mastella e il consigliere delegato allo Sport, Enzo Lauro.")
    
]


struct NewsUIView: View {
    
    @State private var searchText = ""
    var body: some View {
        
            NavigationView{
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                       Group{
                            ForEach(searchResults) {news in
                                NavigationLink(destination: DetailNewsUIView(news: news)) {
                                    CardViewNews(cardsnews: news)
                                }
                            
                            }
                        
                        }.frame(width: 350)
                         .minimumScaleFactor(0.5)
                         
                    }
                    Spacer()
                        
                }.searchable(text: $searchText)
                .navigationBarTitle("Notizie", displayMode:.automatic)
            
            }
            
            
    }
    
    var searchResults: [cardNews]{
        if searchText.isEmpty{
            return cardsNews
        } else {
            return cardsNews.filter{(cardsnews: cardNews) in
                return cardsnews.subTitle.localizedCaseInsensitiveContains(searchText)
                
        }
    }
        


    }
}

struct NewsUIView_Previews: PreviewProvider {
    static var previews: some View {
        NewsUIView()
    }
}
