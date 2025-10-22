//
//  ResultsView.swift
//  Labo4_WKQuatar
//
//  Created by Ilona Defevere on 21/10/2025.
//

import SwiftUI

struct ResultsView: View {
    @State var selectedListItem: String
    
    var body: some View {
        NavigationSplitView {
            ListStadionView()
        } content : {
            ScoreListView()
        } detail: {
            DetailGameView()
        }
    }
}
