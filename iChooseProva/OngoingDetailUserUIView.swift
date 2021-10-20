//
//  OngoingDetailUserUIView.swift
//  iChooseProva
//
//  Created by devannogiovanni on 20/10/21.
//

import SwiftUI

struct OngoingDetailUserUIView: View {
    var poll: Poll
    @ObservedObject private var appPoll = Singleton.shared
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
                    Button(action: {
                        var newPoll = poll
                        newPoll.typePoll = 3
                        appPoll.changeState(poll: newPoll)
                        //appPoll.voto = "I agree"
                    }) {
                        Text("I agree")
                    }
                    .font(.system(size: 15, weight:.bold, design: .rounded))
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(40)
                    .shadow(radius: 1)
                    .offset(x: -8, y: 0)
                    
                    
                    Button(action: {
                        var newPoll = poll
                        newPoll.typePoll = 3
                        appPoll.changeState(poll: newPoll)
                        //appPoll.voto = "I disagree"
                    }) {
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

struct OngoingDetailUserUIView_Previews: PreviewProvider {
    static var previews: some View {
        OngoingDetailUserUIView(poll: Poll(titlePoll: "Prova", imageNamePoll: "mensa", textPoll: "", remainingTime: "23h 59m", progressBar: 100, numberVotes: 10000, typePoll: 1))
    }
}
