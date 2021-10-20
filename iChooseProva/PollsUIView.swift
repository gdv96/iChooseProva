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
    var id = UUID()
}

var pollsOngoing = [
    Poll(titlePoll: "Let’s cycle together on Calore!", imageNamePoll: "mensa", textPoll: "Let us know your thoughts about a brand new public pool to be built in the southern area of the city. The new pool will allow the citiens to practise sports and swimming at discounted fees. Works would start on June 2022 and would be ended in January 2023.Building costs would be 80.000 euros ca.", remainingTime: "15h 30m", progressBar: 92, numberVotes: 15000),
    Poll(titlePoll: "Let’s get the city closer!", imageNamePoll: "mensa", textPoll: "", remainingTime: "1d 20h 10m", progressBar: 60, numberVotes: 8000)
]

var pollsExpired = [
    Poll(titlePoll: "Historic Centre revaluation plan", imageNamePoll: "historicCentre", textPoll: "Let us know your thoughts about a new revaluation plan for our Historic Town Centre. The building will safely be demolished and rebuilt, in order to relaunch tourism. Works would start on August 2022 and would be ended in June 2023.Building costs would be 360.000 euros ca.", remainingTime: "Expired", progressBar: 100, numberVotes: 20000),
    Poll(titlePoll: "A new public pool for our town!", imageNamePoll: "pool", textPoll: "Let us know your thoughts about a brand new public pool to be built in the southern area of the city. The new pool will allow the citiens to practise sports and swimming at discounted fees. Works would start on June 2022 and would be ended in January 2023.Building costs would be 80.000 euros ca.", remainingTime: "Expired", progressBar: 30, numberVotes: 4000)
]

var pollsVoted = [
    Poll(titlePoll: "A new public pool for our town!", imageNamePoll: "pool", textPoll: "Let us know your thoughts about a brand new public pool to be built in the southern area of the city. The new pool will allow the citiens to practise sports and swimming at discounted fees. Works would start on June 2022 and would be ended in January 2023.Building costs would be 80.000 euros ca.", remainingTime: "Expired", progressBar: 30, numberVotes: 4000)
]

//var user:String = "giodv28"
//var password:String = "mypassword"

var user:String = ""
var password:String = ""



struct PollsUIView: View {
       @State private var speed = 50.0
       @State private var isEditing = false
       @State private var pollsState = 0
       @State private var searchText = ""
    
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
                                              /*CardViewOngoing(pollsOngoing: pollOngoing)*/
                                              NavigationLink(destination: OngoingDetailView(titleDetail: pollOngoing.titlePoll, testoCompleto: pollOngoing.textPoll , imageDetail: pollOngoing.imageNamePoll)) {
                                                   CardViewOngoing(pollsOngoing: pollOngoing)
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
                                              /*CardViewOngoing(pollsOngoing: pollOngoing)*/
                                              NavigationLink(destination: OngoingUserDetailView(/*pollsProva: self.pollsOngoing[pollOngoing],*/ titleDetail: pollOngoing.titlePoll, testoCompleto: pollOngoing.textPoll, imageDetail: pollOngoing.imageNamePoll)) {
                                                   CardViewOngoing(pollsOngoing: pollOngoing)
                                                }
                                               }
                                           }
                                       }.frame(width: 350)
                                        .minimumScaleFactor(0.5)
                                   }
                           }
                           
                               /*ScrollView(.vertical, showsIndicators: false){
                                   VStack{
                                      Group{
                                          ForEach(searchResults) {pollOngoing in
                                              /*CardViewOngoing(pollsOngoing: pollOngoing)*/
                                               NavigationLink(destination: OngoingDetailView(titleDetail: pollOngoing.subTitle, testoCompleto: pollOngoing.testo, imageDetail: pollOngoing.imageName)) {
                                                   CardViewOngoing(pollsOngoing: pollOngoing)
                                                }
                                               }
                                           }
                                       }.frame(width: 350)
                                        .minimumScaleFactor(0.5)
                                   }*/
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
                return pollsOngoing.titlePoll.localizedCaseInsensitiveContains(searchText)
                
        }
    }
        
   }

    var searchResults2: [Poll]{
        if searchText.isEmpty{
            return pollsExpired
        } else {
            return pollsExpired.filter{(pollsExpired: Poll) in
                return pollsExpired.titlePoll.localizedCaseInsensitiveContains(searchText)
                
        }
    }
        
   }
    
    var searchResults3: [Poll]{
        if searchText.isEmpty{
            return pollsVoted
        } else {
            return pollsVoted.filter{(pollsVoted: Poll) in
                return pollsVoted.titlePoll.localizedCaseInsensitiveContains(searchText)
                
        }
    }
        
   }
}


struct PollsUIView_Previews: PreviewProvider {
    static var previews: some View {
        PollsUIView()
    }
}

struct OngoingDetailView: View {
    var titleDetail: String
    var testoCompleto: String
    var imageDetail: String
    //@Binding var indicePollsOngoing: Int
    var body: some View {
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
                HStack{
                    Button(action: {}) {
                        Text("I agree")
                    }
                    .font(.system(size: 15, weight:.bold, design: .rounded))
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(40)
                    .shadow(radius: 1)
                    .offset(x: -8, y: 0)
                    
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("I disagree")
                    }
                    .font(.system(size: 15, weight:.bold, design: .rounded))
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(40)
                    .shadow(radius: 1)
                    .offset(x: 8, y: 0)
                }
                Spacer()
                
            }
            
        }
        
    }
}

struct OngoingUserDetailView: View {
    //@Binding var pollsProva: Poll
    //@Binding var pollsProva: Int
    var titleDetail: String
    var testoCompleto: String
    var imageDetail: String
    //@Binding var indicePollsOngoing: Int
    
    var body: some View {
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
                HStack{
                    Button(action: {}) {
                        Text("I agree")
                    }
                    .font(.system(size: 15, weight:.bold, design: .rounded))
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(40)
                    .shadow(radius: 1)
                    .offset(x: -8, y: 0)
                    
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("I disagree")
                    }
                    .font(.system(size: 15, weight:.bold, design: .rounded))
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(40)
                    .shadow(radius: 1)
                    .offset(x: 8, y: 0)
                }
                Spacer()
                
            }
            
        }
        
    }
}

struct CardViewOngoing: View {
    
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
}

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

