//
//  OngoingDetailNotUserUIView.swift
//  iChooseProva
//
//  Created by devannogiovanni on 20/10/21.
//

import SwiftUI

struct OngoingDetailNotUserUIView: View {
    var poll: Poll
    @ObservedObject private var appPoll = PollMemory.shared
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                Image(poll.imageNamePoll)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                    .padding()
                Text(poll.titlePoll)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .padding()
                Text(poll.textPoll)
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

struct OngoingDetailNotUserUIView_Previews: PreviewProvider {
    static var previews: some View {
        OngoingDetailNotUserUIView(poll: Poll(titlePoll: "prova", imageNamePoll: "mensa", textPoll: "", remainingTime: "14h 30m", progressBar: 100, numberVotes: 10000, typePoll: 1))
    }
}
