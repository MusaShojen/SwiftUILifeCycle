//
//  NutritionInfoView.swift
//  SwiftUILifeCycle
//
//  Created by Муса Шогенов on 10.10.2023.
//

import SwiftUI

struct NutritionInfoView: View {
    @Binding var isPresented: Bool
    @Binding var nutritionData: Nutrition?
    var body: some View {
        VStack {
                    Text("Nutrition Info")
                    
                    if let nutritionData = nutritionData {
                        Text("Protein: \(String(format: "%.2f", nutritionData.proteinG))")
                        Text("Carbohydrates: \(String(format: "%.2f", nutritionData.carbohydratesTotalG))")
                        Text("Fat: \(String(format: "%.2f", nutritionData.fatTotalG))")
                    } else {
                        Text("Loading...")
                    }
           
                
        }
        .onAppear{
            print("NutritionInfoView appeared")
        }
        .onDisappear{
            nutritionData = nil
            print("NutritionInfoView disappeared")
        }
        
        .padding()
        .gesture(
                   DragGesture()
                       .onEnded { value in
                           if value.translation.height > 50 {
                              print("Swiped")
                               isPresented = false
                           }
                       }
                   
                   )
                   }
}

