//
//  WelcomeView.swift
//  Labo4_WKQuatar
//
//  Created by Ilona Defevere on 21/10/2025.
//

import SwiftUI

struct WelcomeView: View {
    @Environment(WKDataStore.self) var wkDataStore
@State var selectedTeam: String?
    
    var body: some View {
        VStack {

            Text("WK QATAR 2020")
                .font(.largeTitle)
            Text("Select your favorite team ...")
            List(wkDataStore.getAllTeams(), id: \.self, selection: $selectedTeam){
                team in
                Text(team)
            }
            if(selectedTeam != nil) {
                //dan moet de knop komen
                //tot  hier aan gekomen
            }
        }
    }
}
