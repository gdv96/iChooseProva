//
//  ExpiredDetailUIView.swift
//  iChooseProva
//
//  Created by devannogiovanni on 20/10/21.
//

import SwiftUI

struct ExpiredDetailUIView: View {
    var poll: Poll
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
                Spacer()
                
            }
            
        }
        
    }
}

struct ExpiredDetailUIView_Previews: PreviewProvider {
    static var previews: some View {
        ExpiredDetailUIView(poll: Poll(titlePoll: "prova", imageNamePoll: "mensa", textPoll: "", remainingTime:"", progressBar: 100, numberVotes: 10000, typePoll: 1))
    }
}
