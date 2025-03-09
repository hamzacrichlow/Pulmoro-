//
//  Calculations.swift
//  PulmoroApp
//
//  Created by Hamza Crichlow on 3/8/25.
//

import SwiftUI

struct RespiratoryCalculations : Hashable {
    let name: String
}

struct Calculations: View {
    
    
    var calculationsList: [RespiratoryCalculations] = [
        .init(name: "A-a Gradient") ,
        .init(name: "Compliance"),
        .init(name: "Desired PaCO₂"),
        .init(name: "Oxygen Content") ,
        .init(name: "Oxygen Index"),
        .init(name: "Oxygen Tank Duration") ,
        .init(name: "Tidal Volume"),
        .init(name: "P/F Ratio")
    ]
    
    var body: some View {
        
        NavigationStack{
            
            List{
                Section("Respiratory") {
                    ForEach(calculationsList, id: \.name) { calculation in
                        NavigationLink(value: calculation) {
                            Text(calculation.name)
                        }
                    }
                }
            }
            .navigationTitle("Calculations")
            .navigationDestination(for: RespiratoryCalculations.self) { calculation in
                switch calculation.name {
                case "A-a Gradient":
                    AaGradientCalculator.init()
                case "Compliance":
                    ComplianceCalculator.init()
                case "Desired PaCO₂":
                    DesiredCO2Calculator.init()
                case "Oxygen Content":
                    OxygenContentCalculator.init()
                case "Oxygen Index":
                    OxygenIndexCalculator.init()
                case "Oxygen Tank Duration":
                    OxygenTankDurationCalculator.init()
                case "Tidal Volume":
                    TidalVolumeCalculation.init()
                default:
                    Text("Coming Soon!")
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    InfoButtonView()
                }
            }
            
        }
        
    }
}


#Preview {
    Calculations()
}




