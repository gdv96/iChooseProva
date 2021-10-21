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

struct NewsUIView: View {
    @ObservedObject private var appNews = NewsMemory.shared2
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
            return appNews.newsArray
        } else {
            return appNews.newsArray.filter{(cardsnews: cardNews) in
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
