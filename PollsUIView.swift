//
//  PollsUIView.swift
//  iChooseProva
//
//  Created by devannogiovanni on 18/10/21.
//

import SwiftUI

struct Poll: Identifiable{
    var title: String
    var subTitle: String
    var date: String
    var imageName: String
    var testo: String
    var id = UUID()
}

var pollsOngoing = [
    Poll(title:"01/10/21", subTitle:"Nuovo ponte sul torrente Epitaffio,a breve l’appalto per l’assegnazione dei lavori", date:"", imageName:"ponteepitaffio", testo: "L’Ufficio Espropri, con riferimento ai lavori di realizzazione del nuovo ponte sul torrente Epitaffio (che collega la via Appia con la chiesa di S. Anna), rende noto che lo scorso 23 settembre sono state avviate le azioni di presa di possesso dei terreni e che le suddette azioni si concluderanno la prossima settimana.Esaurita tale fase, quindi, si procederà all’appalto per l’assegnazione dei lavori e all’esecuzione degli stessi, che si concluderanno nel giro di quattro/cinque mesi."),
]

var pollsExpired = [
    Poll(title:"01/10/21", subTitle:"Nuovo ponte sul torrente Epitaffio,a breve l’appalto per l’assegnazione dei lavori", date:"", imageName:"ponteepitaffio", testo: "L’Ufficio Espropri, con riferimento ai lavori di realizzazione del nuovo ponte sul torrente Epitaffio (che collega la via Appia con la chiesa di S. Anna), rende noto che lo scorso 23 settembre sono state avviate le azioni di presa di possesso dei terreni e che le suddette azioni si concluderanno la prossima settimana.Esaurita tale fase, quindi, si procederà all’appalto per l’assegnazione dei lavori e all’esecuzione degli stessi, che si concluderanno nel giro di quattro/cinque mesi."),
]

var pollsVoted = [
    Poll(title:"01/10/21", subTitle:"Nuovo ponte sul torrente Epitaffio,a breve l’appalto per l’assegnazione dei lavori", date:"", imageName:"ponteepitaffio", testo: "L’Ufficio Espropri, con riferimento ai lavori di realizzazione del nuovo ponte sul torrente Epitaffio (che collega la via Appia con la chiesa di S. Anna), rende noto che lo scorso 23 settembre sono state avviate le azioni di presa di possesso dei terreni e che le suddette azioni si concluderanno la prossima settimana.Esaurita tale fase, quindi, si procederà all’appalto per l’assegnazione dei lavori e all’esecuzione degli stessi, che si concluderanno nel giro di quattro/cinque mesi."),
]


struct PollsUIView: View {
       @State private var speed = 50.0
       @State private var isEditing = false
       @State private var pollsState = 0
       @State private var searchText = ""
    
    var body: some View {
        
        NavigationView{
            VStack {
                           Picker("What is your favorite food?", selection: $pollsState) {
                               Text("Ongoing").tag(0)
                               Text("Expired").tag(1)
                               Text("Voted").tag(2)
                           }
                           .pickerStyle(.segmented)
                           .padding(.horizontal)
                       if pollsState == 0 {
                               ScrollView(.vertical, showsIndicators: false){
                                   VStack{
                                      Group{
                                          ForEach(searchResults) {pollOngoing in
                                              CardViewOngoing(pollsOngoing: pollOngoing)
                                               /*NavigationLink(destination: DetailView(titleDetail: pollsOngoing.subTitle, testoCompleto: pollsOngoing.testo, imageDetail: pollsOngoing.imageName)) {
                                                   CardView2(pollsOngoing: pollsOngoing)*/
                                               }
                                           }
                                       }.frame(width: 350)
                                        .minimumScaleFactor(0.5)
                                   }
                                   //Spacer()
                       }
                           else if pollsState == 1 {
                               ScrollView(.vertical, showsIndicators: false){
                                   VStack{
                                      Group{
                                          ForEach(searchResults2) {pollExpired in
                                              CardViewExpired(pollsExpired: pollExpired)
                                               /*NavigationLink(destination: DetailView(titleDetail: pollsOngoing.subTitle, testoCompleto: pollsOngoing.testo, imageDetail: pollsOngoing.imageName)) {
                                                   CardView2(pollsOngoing: pollsOngoing)*/
                                               }
                                           }
                                       }.frame(width: 350)
                                        .minimumScaleFactor(0.5)
                                   }
                           } else {
                               ScrollView(.vertical, showsIndicators: false){
                                   VStack{
                                      Group{
                                          ForEach(searchResults3) {pollVoted in
                                              CardViewVoted(pollsVoted: pollVoted)
                                               /*NavigationLink(destination: DetailView(titleDetail: pollsOngoing.subTitle, testoCompleto: pollsOngoing.testo, imageDetail: pollsOngoing.imageName)) {
                                                   CardView2(pollsOngoing: pollsOngoing)*/
                                               }
                                           }
                                       }.frame(width: 350)
                                        .minimumScaleFactor(0.5)
                                   }
                           }

                           Spacer()
    }.navigationBarTitle("Polls", displayMode:.automatic)
        }.searchable(text: $searchText)
                       }
    
    var searchResults: [Poll]{
        if searchText.isEmpty{
            return pollsOngoing
        } else {
            return pollsOngoing.filter{(pollsOngoing: Poll) in
                return pollsOngoing.subTitle.localizedCaseInsensitiveContains(searchText)
                
        }
    }
        
   }

    var searchResults2: [Poll]{
        if searchText.isEmpty{
            return pollsExpired
        } else {
            return pollsExpired.filter{(pollsExpired: Poll) in
                return pollsExpired.subTitle.localizedCaseInsensitiveContains(searchText)
                
        }
    }
        
   }
    
    var searchResults3: [Poll]{
        if searchText.isEmpty{
            return pollsVoted
        } else {
            return pollsVoted.filter{(pollsVoted: Poll) in
                return pollsVoted.subTitle.localizedCaseInsensitiveContains(searchText)
                
        }
    }
        
   }
}


struct PollsUIView_Previews: PreviewProvider {
    static var previews: some View {
        PollsUIView()
    }
}

struct CardViewOngoing: View {
    
    var pollsOngoing: Poll
    var body: some View {
    
        VStack{
            HStack{
            Image(pollsOngoing.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                //.padding(.horizontal)
                VStack {
                            ProgressView(value: 80.5, total: 100)
                        
                            .accentColor(Color.green)
                            .scaleEffect(x: 1, y: 4, anchor: .center)
                            .padding(.top)
                            .padding(.horizontal)
                          
                            
                    Text("cvdvd")
                        .padding(5)
                    HStack{
                        Image(systemName: "clock")
                            .foregroundColor(.red)
                        Text("- 3d 20h")
                            
                    }
                    
                    
                            /*ProgressView(value: 10.5, total: 100)
                            .accentColor(Color.red)
                            .scaleEffect(x: 1, y: 4, anchor: .center)
                            .padding(.horizontal)*/
                    
                        }
            }
        HStack{
            VStack(alignment: .leading){
                Text(pollsOngoing.title)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                Text(pollsOngoing.subTitle)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                Text(pollsOngoing.date)
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

struct CardViewExpired: View {
    
    var pollsExpired: Poll
    var body: some View {
    
        VStack{
            HStack{
            Image(pollsExpired.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                //.padding(.horizontal)
                VStack {
                            ProgressView(value: 80.5, total: 100)
                        
                            .accentColor(Color.green)
                            .scaleEffect(x: 1, y: 4, anchor: .center)
                            .padding(.top)
                            .padding(.horizontal)
                          
                            
                    Text("cvdvd")
                        .padding(5)
                    HStack{
                        Image(systemName: "clock")
                            .foregroundColor(.red)
                        Text("- 3d 20h")
                            
                    }
                    
                    
                            /*ProgressView(value: 10.5, total: 100)
                            .accentColor(Color.red)
                            .scaleEffect(x: 1, y: 4, anchor: .center)
                            .padding(.horizontal)*/
                    
                        }
            }
        HStack{
            VStack(alignment: .leading){
                Text(pollsExpired.title)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                Text(pollsExpired.subTitle)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                Text(pollsExpired.date)
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


struct CardViewVoted: View {
    
    var pollsVoted: Poll
    var body: some View {
    
        VStack{
            HStack{
            Image(pollsVoted.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                //.padding(.horizontal)
                VStack {
                            ProgressView(value: 80.5, total: 100)
                        
                            .accentColor(Color.green)
                            .scaleEffect(x: 1, y: 4, anchor: .center)
                            .padding(.top)
                            .padding(.horizontal)
                          
                            
                    Text("cvdvd")
                        .padding(5)
                    HStack{
                        Image(systemName: "clock")
                            .foregroundColor(.red)
                        Text("- 3d 20h")
                            
                    }
                    
                    
                            /*ProgressView(value: 10.5, total: 100)
                            .accentColor(Color.red)
                            .scaleEffect(x: 1, y: 4, anchor: .center)
                            .padding(.horizontal)*/
                    
                        }
            }
        HStack{
            VStack(alignment: .leading){
                Text(pollsVoted.title)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                Text(pollsVoted.subTitle)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                Text(pollsVoted.date)
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



