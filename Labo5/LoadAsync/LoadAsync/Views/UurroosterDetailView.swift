//
//  UurroosterDetailView.swift
//  LoadAsync
//
//  Created by Ilona Defevere on 04/11/2025.
//

import SwiftUI

struct UurroosterDetailView: View {
    @Environment(UurroosterDataStore.self) var uurroosterDataStore
    
    var body: some View {
        VStack {
            var uurrooster = uurroosterDataStore.getUurrooster()
            
            for item in uurroosterDataStore.getUurrooster() {
                Text(uurroosterDataStore)
            }
        }
    }
}
