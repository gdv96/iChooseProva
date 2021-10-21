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
       @ObservedObject private var appPoll = PollMemory.shared
    
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
                                                  CardViewExpiredUIView(pollsExpired: pollExpired)
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
                                                  CardViewVotedUIView(pollsVoted: pollVoted)
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
