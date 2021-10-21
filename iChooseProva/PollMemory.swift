//
//  PollMemory.swift
//  iChooseProva
//
//  Created by devannogiovanni on 21/10/21.
//

import Foundation
class Singleton: ObservableObject {
    static var shared: Singleton = {
        let instance = Singleton()
        return instance
    }()
    
    
    func getOngoing() -> [Poll]{
        var pollsOngoing: [Poll]
        pollsOngoing = polls.filter({
           return $0.typePoll == 1
        })
        return pollsOngoing
    }
    
    func getExpired() -> [Poll]{
        var pollsExpired: [Poll]
        pollsExpired = polls.filter({
           return $0.typePoll == 2
        })
        return pollsExpired
    }
    
    func getVoted() -> [Poll]{
        var pollsVoted: [Poll]
        pollsVoted = polls.filter({
           return $0.typePoll == 3
        })
        return pollsVoted
    }
    
    func changeState(poll: Poll){
        polls.removeAll(where: {$0.id == poll.id})
        polls.append(poll)
        
    }
    
    //@Published var voto: String = ""
    
    @Published var polls = [
        Poll(titlePoll: "Let’s cycle together on Calore!", imageNamePoll: "pistaCiclabile", textPoll: "Let us know your thoughts about a brand new public pool to be built in the southern area of the city. The new pool will allow the citiens to practise sports and swimming at discounted fees. Works would start on June 2022 and would be ended in January 2023.Building costs would be 80.000 euros ca.", remainingTime: "15h 30m", progressBar: 92, numberVotes: 15000, typePoll: 1),
        Poll(titlePoll: "Let’s get the city closer!", imageNamePoll: "ponte", textPoll: "Let us know your thoughts about a brand new bridge to be built in our town territory.The new 1 km long bridge will link the north bank of Calore river to the south bank. Works would start on May 2022 and would be ended in April 2023.Building costs would be 60.000 euros ca.", remainingTime: "1d 20h 10m", progressBar: 60, numberVotes: 8000, typePoll: 1),
        Poll(titlePoll: "Historic Centre revaluation plan", imageNamePoll: "historicCentre", textPoll: "Let us know your thoughts about a new revaluation plan for our Historic Town Centre. The building will safely be demolished and rebuilt, in order to relaunch tourism. Works would start on August 2022 and would be ended in June 2023.Building costs would be 360.000 euros ca.", remainingTime: "Expired", progressBar: 100, numberVotes: 20000,typePoll: 2),
        Poll(titlePoll: "A new public pool for our town!", imageNamePoll: "pool", textPoll: "Let us know your thoughts about a brand new public pool to be built in the southern area of the city. The new pool will allow the citiens to practise sports and swimming at discounted fees. Works would start on June 2022 and would be ended in January 2023.Building costs would be 80.000 euros ca.", remainingTime: "Expired", progressBar: 30, numberVotes: 4000, typePoll: 2)
        
    ]
    
}
