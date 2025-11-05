//
//  ContentView.swift
//  Labo3_RPN
//
//  Created by Ilona Defevere on 08/10/2025.
//

import SwiftUI

struct ContentView: View {
    //@State -> houd de waarde bij
    @State var number = 3
    @State var number2 = MyNumber()
    var body: some View {
        VStack {
            Text("Number:" + "\(number2)")
            Button("Press me") {
                number2.increment()
            }
            
            Grid {
                GridRow{
                    //tot -> ..
                    ForEach(1..<4) { number
                        in
                        Button("\(number)") {
                            number2.increment()
                        }
                    }

                }
                GridRow{
                    Button("Clear") {
                        number2.increment()
                    }.gridCellColumns(2)

                    Button("Enter") {
                        number2.increment()
                    }.gridCellColumns(2)
                }

            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
