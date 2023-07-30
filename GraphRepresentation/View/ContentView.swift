//
//  ContentView.swift
//  GraphRepresentation
//
//  Created by Tomasz Kubicki on 19/07/2023.
//

import SwiftUI
import Charts

struct ContentView: View {
    
    @EnvironmentObject var temperature: ContentModel
    
    var body: some View {
        
        let data = temperature.temperatures
        VStack {
            Chart(data) { temp in
                LineMark(
                    x: .value("Date", temp.id!),
                    y: .value("Temp", temp.temp!)
                )
                .foregroundStyle(
                                .linearGradient(
                                // You can have more colours here depends on your data.
                                    colors: [.blue, .red],
                                startPoint: .bottom,
                                endPoint: .top)
                            )
            }
            .labelsHidden()
            .chartYScale(domain: 30...70).chartYAxis() {
                AxisMarks(position: .automatic)
            }
            .chartXScale(type: .none)
            .scrollContentBackground(.visible)
//            .chartPlotStyle { content in
//                content.frame(width: 500, height: 500)
//            }
            .scrollDisabled(false)
            .scrollIndicators(.visible)
            
            
            Text(String(data.count))
                .font(.largeTitle)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
            .environmentObject(ContentModel())
    }
}
