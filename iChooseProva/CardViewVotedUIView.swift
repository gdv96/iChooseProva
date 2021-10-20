//
//  CardViewVotedUIView.swift
//  iChooseProva
//
//  Created by devannogiovanni on 20/10/21.
//

import SwiftUI

struct CardViewVotedUIView: View {
    
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

struct CardViewVotedUIView_Previews: PreviewProvider {
    static var previews: some View {
        CardViewVotedUIView(pollsVoted: Poll(titlePoll: "Prova", imageNamePoll: "mensa", textPoll: "", remainingTime: "23h 59m", progressBar: 100, numberVotes: 10000, typePoll: 1))
    }
}
