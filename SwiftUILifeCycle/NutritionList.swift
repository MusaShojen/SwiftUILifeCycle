//
//  NutritionList.swift
//  SwiftUILifeCycle
//
//  Created by Муса Шогенов on 9.10.2023.
//

import SwiftUI

struct NutritionList: View {
    
    
    let arr = ["Apple","Pineapple","Watermelon","Melon","Peach","Tomato","Potato", "Lemon","Cucumber","Blueberry", "Strawberry","Cabbage", "Bell pepper"]
    
    
    var body: some View {
        NavigationSplitView {
            List(arr, id: \.self){ nutrition in
                NavigationLink{
                    NutritionView(nutrition: nutrition.lowercased())
                    
                } label: {
                    NutritionRow(image: Image(nutrition.lowercased()),name:nutrition)
                }
                }
            
            .navigationTitle("Fruits and vegetables")
            .padding()
        } detail: {
            Text("Select nutrition")
        }
        .onAppear {
            print("NutritionList appeared")
          
        }
        .onDisappear{
            print("NutritionList disappeared")
        }
    }
    
  
}

#Preview {
    NutritionList()
}
