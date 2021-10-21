//
//  VotedDetailUIView.swift
//  iChooseProva
//
//  Created by devannogiovanni on 20/10/21.
//

import SwiftUI

struct VotedDetailUIView: View {
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
                //Text(appPoll.voto)
                Text("You voted")
                Spacer()
                
            }
            
        }
        
    }
}

struct VotedDetailUIView_Previews: PreviewProvider {
    static var previews: some View {
        VotedDetailUIView(poll: Poll(titlePoll: "prova", imageNamePoll: "mensa", textPoll: "", remainingTime:"", progressBar: 100, numberVotes: 10000, typePoll: 1))
    }
}
