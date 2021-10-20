//
//  PollsUIView.swift
//  iChooseProva
//
//  Created by devannogiovanni on 18/10/21.
//

import SwiftUI

struct Poll: Identifiable{
    var titlePoll: String
    var imageNamePoll: String
    var textPoll: String
    var remainingTime: String
    var progressBar: Float
    var numberVotes: Int
    var typePoll: Int
    var id = UUID()
}

var user:String = "giodv28"
var password:String = "mypassword"

//var user:String = ""
//var password:String = ""

struct PollsUIView: View {
       @State private var speed = 50.0
       @State private var isEditing = false
       @State private var pollsState = 0
       @State private var searchText = ""
       @ObservedObject private var appPoll = Singleton.shared
    
    var body: some View {
        
        NavigationView{
            VStack {
                           Picker("", selection: $pollsState) {
                               Text("Ongoing").tag(0)
                               Text("Expired").tag(1)
                               Text("Voted").tag(2)
                           }
                           .pickerStyle(.segmented)
                           .padding(.horizontal)
                       if pollsState == 0 {
                           if((user.isEmpty) && (password.isEmpty)){
                               ScrollView(.vertical, showsIndicators: false){
                                   VStack{
                                      Group{
                                          ForEach(searchResults) {pollOngoing in
                                              NavigationLink(destination: OngoingDetailNotUserUIView(poll: pollOngoing)) {
                                                   CardViewOngoingUIView(pollsOngoing: pollOngoing)
                                                }
                                               }
                                           }
                                       }.frame(width: 350)
                                        .minimumScaleFactor(0.5)
                                   }
                           }else{
                               ScrollView(.vertical, showsIndicators: false){
                                   VStack{
                                      Group{
                                          ForEach(searchResults) {pollOngoing in
                                              NavigationLink(destination:OngoingDetailUserUIView(poll: pollOngoing)) {
                                                   CardViewOngoingUIView(pollsOngoing: pollOngoing)
                                                }
                                               }
                                           }
                                       }.frame(width: 350)
                                        .minimumScaleFactor(0.5)
                                   }
                           }
                           
                       }
                           else if pollsState == 1 {
                               ScrollView(.vertical, showsIndicators: false){
                                   VStack{
                                      Group{
                                          ForEach(searchResults2) {pollExpired in
                                              NavigationLink(destination:ExpiredDetailUIView(poll: pollExpired)) {
                                                   CardViewExpired(pollsExpired: pollExpired)
                                                }
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
                                              NavigationLink(destination:VotedDetailUIView(poll: pollVoted)) {
                                                  CardViewVoted(pollsVoted: pollVoted)
                                                }
                                              
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
            return appPoll.getOngoing()
        } else {
            return appPoll.getOngoing().filter{(pollOngoing: Poll) in
                return pollOngoing.titlePoll.localizedCaseInsensitiveContains(searchText)
                
        }
    }
        
   }

    var searchResults2: [Poll]{
        if searchText.isEmpty{
            return appPoll.getExpired()
        } else {
            return appPoll.getExpired().filter{(pollExpired: Poll) in
                return pollExpired.titlePoll.localizedCaseInsensitiveContains(searchText)
                
        }
    }
        
   }
    
    var searchResults3: [Poll]{
        if searchText.isEmpty{
            return appPoll.getVoted()
        } else {
            return appPoll.getVoted().filter{(pollVoted: Poll) in
                return pollVoted.titlePoll.localizedCaseInsensitiveContains(searchText)
                
        }
    }
        
   }
    
    
}

struct PollsUIView_Previews: PreviewProvider {
    static var previews: some View {
        PollsUIView()
    }
}

//-----------------------------CardView------------------------------------

/*struct CardViewOngoing: View {
    
    var pollsOngoing: Poll
    var body: some View {
    
        VStack{
            HStack{
                Image(pollsOngoing.imageNamePoll)
                .resizable()
                .aspectRatio(contentMode: .fit)
                //.frame(width: 200, height: 100)
                .cornerRadius(5)
                .padding(5)
                
                VStack {
                    ProgressView(value: pollsOngoing.progressBar, total: 100)
                        
                            .accentColor(Color.green)
                            .scaleEffect(x: 1, y: 4, anchor: .center)
                            .padding(.top)
                            .padding(.horizontal)
                          
                            
                    Text("\(pollsOngoing.numberVotes) people already voted")
                        .font(.system(size: 10, weight:.bold, design: .rounded))
                        .foregroundColor(.black)
                        .padding(5)
                    HStack{
                        Image(systemName: "clock")
                            .foregroundColor(.red)
                        Text(pollsOngoing.remainingTime)
                            .foregroundColor(.black)
                            
                    }
                    
                    
                            /*ProgressView(value: 10.5, total: 100)
                            .accentColor(Color.red)
                            .scaleEffect(x: 1, y: 4, anchor: .center)
                            .padding(.horizontal)*/
                    
                        }
            }
        HStack{
            VStack(alignment: .leading){
                Text(pollsOngoing.titlePoll)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
        }.padding()
                
            }.cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 5))
            .padding([.top, .vertical ])
    }
}*/

struct CardViewExpired: View {
    
    var pollsExpired: Poll
    var body: some View {
    
        VStack{
            HStack{
                Image(pollsExpired.imageNamePoll)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5)
                .padding(5)
                //.padding(.horizontal)
                VStack {
                    ProgressView(value: pollsExpired.progressBar, total: 100)
                        
                            .accentColor(Color.green)
                            .scaleEffect(x: 1, y: 4, anchor: .center)
                            .padding(.top)
                            .padding(.horizontal)
                          
                            
                    Text("\(pollsExpired.numberVotes) people already voted")
                        .font(.system(size: 10, weight:.bold, design: .rounded))
                        .foregroundColor(.black)
                        .padding(5)
                    HStack{
                        Image(systemName: "clock")
                            .foregroundColor(.red)
                        Text(pollsExpired.remainingTime)
                            .foregroundColor(.black)
                            
                    }
                    
                    
                            /*ProgressView(value: 10.5, total: 100)
                            .accentColor(Color.red)
                            .scaleEffect(x: 1, y: 4, anchor: .center)
                            .padding(.horizontal)*/
                    
                        }
            }
        HStack{
            VStack(alignment: .leading){
                Text(pollsExpired.titlePoll)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .lineLimit(3)
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
                Image(pollsVoted.imageNamePoll)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5)
                .padding(5)
                //.padding(.horizontal)
                VStack {
                    ProgressView(value: pollsVoted.progressBar, total: 100)
                        
                            .accentColor(Color.green)
                            .scaleEffect(x: 1, y: 4, anchor: .center)
                            .padding(.top)
                            .padding(.horizontal)
                          
                            
                    Text("\(pollsVoted.numberVotes) people already voted")
                        .font(.system(size: 10, weight:.bold, design: .rounded))
                        .foregroundColor(.black)
                        .padding(5)
                    HStack{
                        Image(systemName: "clock")
                            .foregroundColor(.red)
                        Text(pollsVoted.remainingTime)
                            .foregroundColor(.black)
                            
                    }
                    
                    
                            /*ProgressView(value: 10.5, total: 100)
                            .accentColor(Color.red)
                            .scaleEffect(x: 1, y: 4, anchor: .center)
                            .padding(.horizontal)*/
                    
                        }
            }
        HStack{
            VStack(alignment: .leading){
                Text(pollsVoted.titlePoll)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .lineLimit(3)
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

