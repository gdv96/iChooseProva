//
//  CardViewOngoingUIView.swift
//  iChooseProva
//
//  Created by devannogiovanni on 20/10/21.
//

import SwiftUI

struct CardViewOngoingUIView: View {
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

struct CardViewOngoingUIView_Previews: PreviewProvider {
    static var previews: some View {
        CardViewOngoingUIView(pollsOngoing: Poll(titlePoll: "prova", imageNamePoll: "mensa", textPoll: "", remainingTime: "23h 59", progressBar: 100, numberVotes: 10000, typePoll: 1))
    }
}
